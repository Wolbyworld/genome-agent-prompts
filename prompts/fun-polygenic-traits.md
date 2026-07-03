# Fun Polygenic Traits

## Purpose

Compute non-medical trait scores for curiosity while reporting uncertainty, score validity, and
coverage. Keep the result clearly separate from health advice.

## Inputs

- `GENOME_SOURCE`: local VCF or gVCF.
- `BUILD`: genome build, such as `GRCh38`.
- `REFERENCE_PANEL`: public reference panel or score distribution.
- `ANCESTRY_CONTEXT`: optional context for limitations.
- `OUTPUT_DIR`: private local output directory.
- Optional measured phenotype fields supplied by the user for comparison.

## Method

1. Select traits with reasonable published support and an available score or model.
2. Use PGS Catalog harmonized files where available and report every PGS ID.
3. Use established model-specific SNP sets where appropriate, such as pigmentation models, and state
   that they output probabilities rather than PRS percentiles.
4. Handle gVCF hom-ref dosage, allele harmonization, palindromic variants, and score coverage.
5. Standardize PRS empirically against `REFERENCE_PANEL` where a percentile is reported.
6. Skip or strongly discourage personality, behavioral, education, and intelligence framings unless
   the prompt is explicitly designed to explain their low individual predictive value.

## Output

Produce one table:

- Trait.
- PGS ID or model.
- Percentile, z-score, or predicted category.
- Coverage.
- Optional comparison to user-supplied phenotype.
- Evidence and limitation note.

## Caveats

Trait PRS are probabilistic and often weak at individual prediction. Measured phenotype and
environment usually explain more than these scores for an individual.

## Reviewer Notes

Review for trait validity, avoidance of behavioral overclaiming, use of appropriate public scores,
and whether optional phenotype comparison is framed carefully.
