# Genome-Agent Prompts

Reusable prompt templates and lightweight verification for local-first genome-agent workflows.

> ⚠️ **Not medical advice. Educational and research use only, provided "as is" with no warranty and
> no liability. Do not use to diagnose, treat, or make any health decision. Use entirely at your own
> risk. By using this repository you accept the [full disclaimer and limitation of liability](DISCLAIMER.md).**

This repository is educational and methodological. It is not diagnostic software, medical advice,
or a substitute for clinical-grade testing, a qualified clinician, or a genetic counselor.

## What This Is

The prompts in `prompts/` are designed to help reviewers and practitioners evaluate agent workflows
for:

- Clinical variant triage with ACMG/ClinVar-style evidence boundaries.
- Pharmacogenomics workflows using PharmCAT, CPIC/DPWG guidance, CYP2D6 callers, and HLA typing.
- Polygenic risk score workflows with explicit score IDs, allele harmonization, reference-panel
  standardization, coverage, and ancestry limitations.
- Wellness and trait reports that grade evidence honestly and label non-credible claims.

The repository intentionally uses public synthetic fixtures only. Do not commit or upload private
genome files, medical reports, generated dashboards, OpenCRAVAT databases, or personal result files.

## Quick Start

```bash
make verify
```

`make verify` runs shell checks, fixture checks, and a private-content scan. It does not run Genomi,
OpenCRAVAT, PharmCAT, Nextflow, Docker, or large reference downloads.

## Prompt Inputs

Prompts use placeholders rather than private paths:

- `GENOME_SOURCE`: local VCF, gVCF, or supported genotype source.
- `READS_R1` / `READS_R2`: optional paired FASTQs for workflows that require reads.
- `BUILD`: genome build, such as `GRCh38`.
- `ANCESTRY_CONTEXT`: optional self-reported or inferred context used only for limitations and
  reference-panel selection.
- `REFERENCE_PANEL`: public reference distribution or callset used for standardization.
- `OUTPUT_DIR`: local private output directory.
- `TMPDIR`: local temporary directory for disk-sensitive workflows.

## Expert Review

Expert feedback is welcome through GitHub issues. Use the issue template that matches your review
lane and include:

1. The prompt section being reviewed.
2. The guideline, paper, tool documentation, or source you are relying on.
3. The failure mode or overclaiming risk.
4. Suggested replacement wording.

Useful review lanes are clinical genetics, pharmacogenomics, PRS/statistical genetics,
bioinformatics reproducibility, and privacy/safety.

## Safety Boundary

- Keep private data local.
- Use synthetic fixtures for tests and documentation.
- Treat all personal genome files and generated reports as private by default.
- Confirm any serious finding with a clinical-grade test and qualified professional review before
  acting on it.
- Do not send private variants, read data, or health reports to remote tools unless the data owner
  explicitly approves that exact transfer.

## License

Released under the [MIT License](LICENSE). The prompts and documentation are provided for
educational and methodological use and carry no warranty.
