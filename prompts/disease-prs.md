# Disease Polygenic Risk Scores

## Purpose

Compute standardized polygenic risk scores for selected common diseases and report where the sample
falls relative to an appropriate reference population.

## Inputs

- `GENOME_SOURCE`: local VCF or gVCF.
- `BUILD`: genome build, such as `GRCh38`.
- `REFERENCE_PANEL`: public reference distribution or genotype panel for standardization.
- `ANCESTRY_CONTEXT`: optional context for reference-panel fit and limitations.
- `OUTPUT_DIR`: private local output directory.
- Tooling: `pgsc_calc` where feasible, or `plink2 --score` with harmonized PGS Catalog scoring
  files and an empirical reference distribution.

## Method

1. Select well-powered PGS Catalog scores appropriate for each trait and report every PGS ID used.
2. Prefer harmonized scoring files matching `BUILD`. If lift-over or custom harmonization is needed,
   document it.
3. Convert local genome data into scoreable genotypes. For gVCFs, handle covered homozygous
   reference blocks correctly. If the effect allele equals the reference allele, homozygous reference
   can imply dosage 2.
4. Harmonize alleles to the scoring file, exclude ambiguous palindromic SNPs unless frequency
   resolvable, and report coverage per score.
5. Standardize empirically against `REFERENCE_PANEL` or an accepted score distribution. Do not use an
   independence assumption for dense genome-wide scores.
6. Report score uncertainty and explain how ancestry, reference selection, coverage, and score choice
   affect interpretation.

## Output

For each disease or trait, report:

- Trait.
- PGS ID and source.
- Raw score.
- Percentile and z-score.
- Coverage.
- Reference panel.
- Plain-language band.
- Limitations.

## Caveats

PRS are probabilistic, ancestry-dependent, and not diagnostic for an individual. They should not be
used alone for medical decisions.

## Reviewer Notes

Review for score selection, standardization method, ancestry caveats, coverage reporting, allele
harmonization, and plain-language bands that do not overstate individual predictive power.


---

**Disclaimer:** Educational and research use only — not medical advice, no warranty, no liability.
See [DISCLAIMER.md](../DISCLAIMER.md). Confirm any finding with a clinical-grade test and a qualified
professional before acting.
