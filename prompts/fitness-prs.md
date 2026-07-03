# Fitness and Physical-Performance PRS

## Purpose

Compute standardized scores for fitness-related traits while emphasizing that training history,
measurement, and environment usually matter more than genetic scores for individual performance.

## Inputs

- `GENOME_SOURCE`: local VCF or gVCF.
- `BUILD`: genome build, such as `GRCh38`.
- `REFERENCE_PANEL`: public reference panel or score distribution.
- `ANCESTRY_CONTEXT`: optional context for limitations.
- `OUTPUT_DIR`: private local output directory.
- Optional measured fitness or biomarker fields supplied by the user.

## Method

1. Prefer better-powered fitness-adjacent traits such as resting heart rate or bone mineral density
   when suitable PGS exist.
2. Treat athlete-status, trainability, and performance specialization scores as weak or directional
   unless there is strong evidence for the selected score.
3. Use PGS Catalog harmonized files and report score IDs, source, and expected predictive power when
   available.
4. Convert local genome data carefully, including gVCF reference blocks, effect-allele dosage,
   palindromic variants, and coverage.
5. Standardize empirically against `REFERENCE_PANEL`.
6. Compare to optional measured phenotype only as a consistency check, not as validation of the
   score.

## Output

Produce a table with:

- Trait.
- PGS ID.
- Percentile.
- Z-score.
- Band.
- Coverage.
- Evidence strength.
- Optional phenotype comparison.
- Limitation note.

## Caveats

Fitness PRS are not performance tests. Training history, injury history, environment, measurement,
and current health status usually dominate individual interpretation.

## Reviewer Notes

Review for score validity, weak athlete-trait claims, reference-panel choice, and whether the prompt
keeps fitness genetics in a non-medical curiosity frame.


---

**Disclaimer:** Educational and research use only — not medical advice, no warranty, no liability.
See [DISCLAIMER.md](../DISCLAIMER.md). Confirm any finding with a clinical-grade test and a qualified
professional before acting.
