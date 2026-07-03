#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

if [[ ! -d fixtures/public ]]; then
  echo 'fixtures/public is missing' >&2
  exit 1
fi

found=0
while IFS= read -r -d '' path; do
  found=1
  size=$(wc -c < "$path")
  if [[ "$size" -gt 20000 ]]; then
    echo "Fixture is too large: $path" >&2
    exit 1
  fi
  if ! grep -q 'SYNTHETIC' "$path"; then
    echo "Fixture must contain SYNTHETIC marker: $path" >&2
    exit 1
  fi
done < <(find fixtures/public -type f -print0)

if [[ "$found" -eq 0 ]]; then
  echo 'No public fixtures found' >&2
  exit 1
fi

printf 'Fixture checks passed.\n'
