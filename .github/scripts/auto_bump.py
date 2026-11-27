#!/usr/bin/env python3
"""Bump casks/formulas to the latest GitHub release, including SHA-256 digests.

For every package that points at GitHub (via homepage, url/verified, or an
explicit `# auto-update-repo: owner/repo` comment), this script:

  1. reads the GitHub releases/latest endpoint (authenticated with GH_TOKEN),
  2. compares the release tag with the `version` stanza,
  3. rewrites `version` and every `sha256` using the release asset digests.

Packages from other hosts are skipped. Files that did not change are left
untouched, so the workflow can commit only real updates.
"""

from __future__ import annotations

import json
import os
import re
import urllib.error
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
TOKEN = os.environ.get("GH_TOKEN") or os.environ.get("GITHUB_TOKEN", "")

VERSION_RE = re.compile(r'^(\s*version\s+)"([^"]+)"', re.MULTILINE)
URL_RE = re.compile(r'^\s*url\s+"([^"]+)"', re.MULTILINE)
HOMEPAGE_RE = re.compile(r'^\s*homepage\s+"([^"]+)"', re.MULTILINE)
SHA_SINGLE_RE = re.compile(r'^(\s*sha256\s+)"([0-9a-fA-F]{64})"', re.MULTILINE)
SHA_ARM_RE = re.compile(r'(sha256\s+arm:\s*)"([0-9a-fA-F]{64})"')
SHA_INTEL_RE = re.compile(r'(intel:\s*)"([0-9a-fA-F]{64})"')
ARCH_RE = re.compile(r'^\s*arch\s+arm:\s*"([^"]+)",\s*intel:\s*"([^"]+)"', re.MULTILINE)
OVERRIDE_RE = re.compile(r"auto-update-repo:\s*([\w.-]+/[\w.-]+)")
GH_RE = re.compile(r"github\.com/([\w.-]+)/([\w.-]+)")
HEX64_RE = re.compile(r"^[0-9a-fA-F]{64}$")


def request_json(url: str) -> dict | None:
    headers = {"Accept": "application/vnd.github+json", "User-Agent": "brew-auto-bump"}
    if TOKEN:
        headers["Authorization"] = f"Bearer {TOKEN}"
    request = urllib.request.Request(url, headers=headers)
    try:
        with urllib.request.urlopen(request, timeout=30) as response:
            return json.load(response)
    except (urllib.error.URLError, TimeoutError, json.JSONDecodeError) as error:
        print(f"  ! GitHub API error: {error}")
        return None


def find_repo(text: str) -> str | None:
    override = OVERRIDE_RE.search(text)
    if override:
        return override.group(1)

    for pattern in (HOMEPAGE_RE, URL_RE):
        for url in pattern.findall(text):
            match = GH_RE.search(url)
            if match:
                owner, repo = match.groups()
                repo = re.sub(r"\.(git|html?)$", "", repo)
                return f"{owner}/{repo}"
    return None


def digests_from_release(release: dict) -> dict[str, str]:
    result = {}
    for asset in release.get("assets", []):
        digest = asset.get("digest") or ""
        if digest.startswith("sha256:"):
            result[asset["name"]] = digest.split(":", 1)[1]
    return result


def concrete(url: str, version: str, arch_value: str | None = None) -> str:
    url = url.replace("#{version}", version)
    if arch_value is not None:
        url = url.replace("#{arch}", arch_value)
    return url


def asset_name(url: str) -> str:
    return url.split("?")[0].rstrip("/").rsplit("/", 1)[-1]


def bump_cask(text: str, version: str, digests: dict[str, str]) -> str:
    urls = URL_RE.findall(text)
    arch_match = ARCH_RE.search(text)
    arch_values = {"arm": arch_match.group(1), "intel": arch_match.group(2)} if arch_match else None

    def digest_for(value: str | None) -> str | None:
        if not urls:
            return None
        name = asset_name(concrete(urls[0], version, value))
        return digests.get(name)

    if arch_values:
        arm_digest = digest_for(arch_values["arm"])
        intel_digest = digest_for(arch_values["intel"])

        def replace_arm(match: re.Match) -> str:
            return f'{match.group(1)}"{arm_digest or match.group(2)}"'

        def replace_intel(match: re.Match) -> str:
            return f'{match.group(1)}"{intel_digest or match.group(2)}"'

        text = SHA_ARM_RE.sub(replace_arm, text)
        text = SHA_INTEL_RE.sub(replace_intel, text)
    else:
        digest = digest_for(None)
        if digest:
            text = SHA_SINGLE_RE.sub(lambda m: f'{m.group(1)}"{digest}"', text)
    return text


def bump_formula(text: str, version: str, digests: dict[str, str]) -> str:
    lines = text.splitlines(keepends=True)
    pending: str | None = None
    result = []
    for line in lines:
        url_match = URL_RE.match(line)
        if url_match:
            name = asset_name(concrete(url_match.group(1), version))
            pending = digests.get(name)
            result.append(line)
            continue
        sha_match = SHA_SINGLE_RE.match(line)
        if sha_match and pending:
            indent = sha_match.group(1)
            result.append(f'{indent}"{pending}"\n')
            pending = None
            continue
        result.append(line)
    return "".join(result)


def process(path: Path, kind: str) -> bool:
    text = path.read_text(encoding="utf-8")
    version_match = VERSION_RE.search(text)
    if not version_match or version_match.group(2) == ":latest":
        return False

    repo = find_repo(text)
    if not repo:
        return False

    release = request_json(f"https://api.github.com/repos/{repo}/releases/latest")
    if not release:
        return False

    new_version = (release.get("tag_name") or "").lstrip("v")
    if not new_version or new_version == version_match.group(2):
        return False

    digests = digests_from_release(release)
    if not digests:
        return False

    updated = text[: version_match.start(2)] + new_version + text[version_match.end(2) :]
    updated = bump_cask(updated, new_version, digests) if kind == "cask" else bump_formula(updated, new_version, digests)
    if updated == text:
        return False

    path.write_text(updated, encoding="utf-8")
    print(f"  {path.name}: {version_match.group(2)} -> {new_version}")
    return True


def main() -> None:
    changed = 0
    for directory, kind in (("Casks", "cask"), ("Formula", "formula")):
        root = ROOT / directory
        if not root.is_dir():
            continue
        print(f"== {directory} ==")
        for path in sorted(p for p in root.rglob("*") if p.is_file() and p.name.strip().endswith(".rb")):
            try:
                if process(path, kind):
                    changed += 1
            except Exception as error:  # keep going; report the issue and move on
                print(f"  ! {path.name}: {error}")
    print(f"Updated {changed} package(s).")


if __name__ == "__main__":
    main()
