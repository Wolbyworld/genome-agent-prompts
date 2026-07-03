#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

# Files whose job is to describe private-content patterns, so they must be
# excluded from the scan or they would flag their own definitions.
scan_excludes=(--exclude-dir=.git --exclude='check_no_private_content.sh' --exclude='.private-scan-patterns' --exclude='.private-scan-patterns.example')

fail=0

is_public_fixture() {
  case "$1" in
    ./fixtures/public/*) return 0 ;;
    *) return 1 ;;
  esac
}

# 1. Private artifact extensions (genomes, reads, databases) outside the public
#    fixtures directory.
check_private_artifact_names() {
  while IFS= read -r -d '' path; do
    is_public_fixture "$path" && continue
    case "$path" in
      *.bam|*.bai|*.cram|*.crai|*.fastq|*.fastq.gz|*.fq|*.fq.gz|*.vcf|*.vcf.gz|*.gvcf|*.gvcf.gz|*.bcf|*.sqlite|*.sqlite3|*.db)
        printf 'Private artifact extension outside fixtures: %s\n' "$path" >&2
        fail=1
        ;;
    esac
  done < <(find . -type f -not -path './.git/*' -print0)
}

# 2. Generic structural patterns that should never appear in a public prompt
#    repository, regardless of whose data it is. These generalize to any
#    contributor rather than matching one author's specific values, so they
#    are safe to ship publicly.
check_generic_patterns() {
  local regexes=(
    '/Users/[^/[:space:]]+/'         # local macOS home paths
    '/home/[^/[:space:]]+/'          # local Linux home paths
    'APOE[[:space:]]+e[0-9]/e[0-9]'  # APOE genotype disclosure
  )
  for regex in "${regexes[@]}"; do
    if grep -RInE "${scan_excludes[@]}" -- "$regex" . >/tmp/genome_agent_prompt_scan_hits.$$; then
      printf 'Private structural pattern found: %s\n' "$regex" >&2
      cat /tmp/genome_agent_prompt_scan_hits.$$ >&2
      fail=1
    fi
  done
  rm -f /tmp/genome_agent_prompt_scan_hits.$$
}

# 3. Optional data-owner denylist of exact private strings (names, sample IDs,
#    biometrics, specific genotypes). This file MUST stay out of git so the
#    values it protects are never published; the public repo ships no literals.
#    Format: one fixed-string pattern per line; blank lines and '#' comments
#    are ignored. See .private-scan-patterns.example.
check_local_denylist() {
  local file=".private-scan-patterns"
  [[ -f "$file" ]] || return 0
  while IFS= read -r pattern || [[ -n "$pattern" ]]; do
    [[ -z "$pattern" || "$pattern" == \#* ]] && continue
    if grep -RInF "${scan_excludes[@]}" -- "$pattern" . >/tmp/genome_agent_prompt_scan_hits.$$; then
      printf 'Private content found for a local denylist pattern.\n' >&2
      cat /tmp/genome_agent_prompt_scan_hits.$$ >&2
      fail=1
    fi
  done < "$file"
  rm -f /tmp/genome_agent_prompt_scan_hits.$$
}

check_private_artifact_names
check_generic_patterns
check_local_denylist

if [[ "$fail" -ne 0 ]]; then
  exit 1
fi

printf 'Private-content scan passed.\n'
