#!/usr/bin/env python3
"""Regenerate the package list in README.md from the Casks/ and Formula/ directories.

The generated block is delimited by `<!-- package-list:start -->` and
`<!-- package-list:end -->`. Everything between the two markers is replaced on
every run, so no manual editing of the list is needed.
"""

from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
README = ROOT / "README.md"
START = "<!-- package-list:start -->"
END = "<!-- package-list:end -->"

FIELDS = {
    "name": re.compile(r'^\s*name\s+"([^"]+)"', re.MULTILINE),
    "desc": re.compile(r'^\s*desc\s+"([^"]+)"', re.MULTILINE),
    "homepage": re.compile(r'^\s*homepage\s+"([^"]+)"', re.MULTILINE),
    "version": re.compile(r'^\s*version\s+"([^"]+)"', re.MULTILINE),
}


def field(text: str, key: str) -> str:
    match = FIELDS[key].search(text)
    return match.group(1) if match else ""


def packages(directory: str, kind: str) -> list[dict[str, str]]:
    root = ROOT / directory
    if not root.is_dir():
        return []

    result = []
    for path in sorted(p for p in root.rglob("*") if p.is_file() and p.name.strip().endswith(".rb")):
        text = path.read_text(encoding="utf-8")
        token = path.name.strip()[:-3]

        if kind == "cask":
            platform = "macOS"
            if "depends_on arch: :arm64" in text:
                arch = "arm64 only"
            elif "sha256 arm:" in text or "arch arm:" in text:
                arch = "arm64 + x86_64"
            else:
                arch = "universal"
        else:
            platform = "macOS + Linux" if "on_macos do" in text else "Linux"
            has_arm64 = "on_arm do" in text
            has_x86_64 = "on_intel do" in text
            if has_arm64 and has_x86_64:
                arch = "arm64 + x86_64"
            elif has_arm64:
                arch = "arm64"
            elif has_x86_64:
                arch = "x86_64"
            else:
                arch = "universal"

        result.append(
            {
                "token": token,
                "name": field(text, "name") or token,
                "version": field(text, "version") or "-",
                "platform": platform,
                "arch": arch,
                "desc": field(text, "desc") or "-",
                "homepage": field(text, "homepage"),
                "kind": kind,
            }
        )
    return result


def home_link(url: str, name: str) -> str:
    if not url:
        return "-"
    return f"[{name}]({url})" if name != url else f"<{url}>"


def render(items: list[dict[str, str]]) -> str:
    lines = [
        "## 📦 Packages",
        "",
        "> Auto-generated from `Casks/` and `Formula/` — do not edit by hand.",
        "",
    ]
    casks = [item for item in items if item["kind"] == "cask"]
    formulas = [item for item in items if item["kind"] == "formula"]
    lines.append(
        f"{len(casks)} cask(s) and {len(formulas)} formula(s). "
        "Install with `brew install --cask <token>` on macOS or "
        "`brew install <token>` on Linux."
    )
    lines.append("")
    lines.append("| Token | Version | Platform | Architecture | Description | Homepage |")
    lines.append("| :--- | :--- | :--- | :--- | :--- | :--- |")
    for item in items:
        lines.append(
            f"| `{item['token']}` | {item['version']} | {item['platform']} | "
            f"{item['arch']} | {item['desc']} | {home_link(item['homepage'], item['name'])} |"
        )
    return "\n".join(lines)


def main() -> None:
    items = packages("Casks", "cask") + packages("Formula", "formula")
    items.sort(key=lambda item: (item["kind"], item["token"].lower()))

    readme = README.read_text(encoding="utf-8")
    block = f"{START}\n{render(items)}\n{END}"

    if START in readme and END in readme:
        before, rest = readme.split(START, 1)
        _, after = rest.split(END, 1)
        updated = before + block + after
    else:
        updated = readme.rstrip() + "\n\n" + block + "\n"

    if updated != readme:
        README.write_text(updated, encoding="utf-8")
        print("README.md package list updated.")
    else:
        print("README.md package list is already up to date.")


if __name__ == "__main__":
    main()
