#!/usr/bin/env bash
# Install every cask or formula in this tap and report a per-package result.
# Usage: install-all.sh cask|formula

set -uo pipefail

kind="${1:?usage: install-all.sh cask|formula}"
tap="idealisan/extra-universe"
tap_dir="$(brew --repository "$tap")"
results="install-results.txt"
: > "$results"

if [ "$kind" = "cask" ]; then
  package_dir="$tap_dir/Casks"
else
  package_dir="$tap_dir/Formula"
fi

if [ ! -d "$package_dir" ]; then
  echo "No $kind directory found at $package_dir"
  exit 0
fi

mapfile -t tokens < <(find "$package_dir" -type f -name '*.rb' -exec basename {} .rb \; | sort)

if [ "${#tokens[@]}" -eq 0 ]; then
  echo "No $kind files found in $package_dir"
  exit 0
fi

run_with_timeout() {
  if command -v gtimeout >/dev/null 2>&1; then
    gtimeout 900 "$@"
  elif command -v timeout >/dev/null 2>&1; then
    timeout 900 "$@"
  else
    "$@"
  fi
}

failed=0
succeeded=0
skipped=0
runner_arch="$(uname -m)"

for token in "${tokens[@]}"; do
  token_file="$(find "$package_dir" -type f -name "${token}.rb" | head -1)"

  # Apple-Silicon-only casks cannot work on an Intel runner.
  if [ "$kind" = "cask" ] && [ "$runner_arch" = "x86_64" ] \
    && grep -q "depends_on arch: :arm64" "$token_file"; then
    printf 'SKIP\t%s\tarm64-only, runner is x86_64\n' "$token" | tee -a "$results"
    skipped=$((skipped + 1))
    continue
  fi

  echo "::group::Install $kind $token"
  start="$(date +%s)"
  if [ "$kind" = "cask" ]; then
    run_with_timeout brew install --cask "$token"
    status=$?
  else
    run_with_timeout brew install "$token"
    status=$?
  fi
  elapsed=$(( $(date +%s) - start ))
  echo "::endgroup::"

  if [ "$status" -eq 0 ]; then
    printf 'OK\t%s\t%ss\n' "$token" "$elapsed" | tee -a "$results"
    succeeded=$((succeeded + 1))
  else
    printf 'FAIL\t%s\t%ss (exit %s)\n' "$token" "$elapsed" "$status" | tee -a "$results"
    failed=$((failed + 1))
  fi

  # Always clean up so one package cannot affect the next.
  if [ "$kind" = "cask" ]; then
    brew uninstall --cask "$token" --force >/dev/null 2>&1 || true
  else
    brew uninstall --formula "$token" --force >/dev/null 2>&1 || true
  fi
done

printf '\nSummary: %s succeeded, %s failed, %s skipped\n' \
  "$succeeded" "$failed" "$skipped" | tee -a "$results"

if [ "$failed" -gt 0 ]; then
  exit 1
fi
