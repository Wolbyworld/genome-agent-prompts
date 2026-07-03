# Privacy Model

This repository should be safe to clone, fork, and inspect publicly.

## Allowed

- Prompt templates.
- Public documentation.
- Tiny synthetic fixtures.
- Lightweight verification scripts.
- Public tool or database references.

## Not Allowed

- Personal genome files or read data.
- Generated result reports.
- Medical documents.
- Local private paths.
- Sample IDs or names.
- OpenCRAVAT SQLite databases.
- Private manifests or hashes.

## Verification

`scripts/check_no_private_content.sh` runs three layers:

1. **Artifact extensions** — flags genome, read, and database files (`.vcf`, `.bam`, `.sqlite`, and
   so on) anywhere outside `fixtures/public/`.
2. **Generic structural patterns** — regexes that should never appear in a public prompt repo
   regardless of whose data it is, such as local home directory paths (under `/Users` or `/home`)
   and APOE genotype disclosures. These ship publicly because they carry no personal value.
3. **Optional local denylist** — if a `.private-scan-patterns` file exists, each line is treated as
   an exact string that must not appear in tracked files. This file is gitignored and must never be
   committed, so a data owner can block their own name, sample IDs, biometrics, or specific
   genotypes without publishing those values. Copy `.private-scan-patterns.example` to get started.

The script contains no personal literals itself. It is a guardrail, not a complete privacy audit;
reviewers should still inspect every new file before publication.
