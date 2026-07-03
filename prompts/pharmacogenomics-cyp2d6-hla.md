# Pharmacogenomics Profile With CYP2D6 and HLA

## Purpose

Produce a pharmacogenomics profile from local genome data, including standard PharmCAT-supported
genes plus CYP2D6 structural variation and key HLA hypersensitivity alleles when read data is
available.

## Inputs

- `GENOME_SOURCE`: local VCF or gVCF for small variant PGx calls.
- `READS_R1` and `READS_R2`: optional paired FASTQs for CYP2D6/HLA workflows.
- `BUILD`: genome build, such as `GRCh38`.
- `OUTPUT_DIR`: private local output directory.
- `TMPDIR`: local temporary directory for disk-sensitive steps.
- Tooling: PharmCAT, `bcftools`, CYP2D6 caller such as Cyrius or Aldy, HLA caller such as OptiType
  or HLA-LA, and optional OpenCRAVAT/OakVar PharmGKB cross-check.

## Method

1. Create a PharmCAT-ready VCF from local variant data using the official preprocessor where
   possible. Record build, reference FASTA, and preprocessing command.
2. Run PharmCAT for supported genes and report diplotype, phenotype, and guideline source.
3. For CYP2D6, use read-aware tooling when available because VCF-only calls can miss structural
   variation and copy-number events. Avoid whole-genome realignment when a targeted approach is
   sufficient and document the disk strategy.
4. For HLA pharmacogenetics, type alleles relevant to drug hypersensitivity, including alleles used
   for abacavir, allopurinol, carbamazepine, and phenytoin guidance.
5. Feed validated outside calls back into PharmCAT when supported, or interpret them separately with
   CPIC/DPWG language.
6. Record tool versions, caller limitations, confidence, and failed or skipped calls.

## Output

Produce a medication-card table:

- Gene or HLA allele.
- Diplotype or allele call.
- Phenotype.
- Drugs affected.
- Guideline source.
- Action wording, framed as confirm-before-prescribing.
- Method and confidence notes.

## Caveats

This is research-grade PGx. Prescribing decisions require clinical confirmation and qualified
medical review. Negative HLA or CYP2D6 results can be limited by caller, coverage, read length,
reference build, and structural-variant handling.

## Reviewer Notes

Review for CPIC/DPWG accuracy, PharmCAT compatibility, CYP2D6 structural-variant assumptions, HLA
caller suitability, and whether the prompt avoids direct prescribing advice.


---

**Disclaimer:** Educational and research use only — not medical advice, no warranty, no liability.
See [DISCLAIMER.md](../DISCLAIMER.md). Confirm any finding with a clinical-grade test and a qualified
professional before acting.
