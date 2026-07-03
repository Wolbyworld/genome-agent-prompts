# Fine Ancestry and Admixture

## Purpose

Estimate fine-scale ancestry components using public reference panels while making model dependence
and resolution limits explicit.

## Inputs

- `GENOME_SOURCE`: local VCF or gVCF.
- `BUILD`: genome build, such as `GRCh38`.
- `REFERENCE_PANEL`: public reference panel, such as 1000 Genomes, HGDP, or a harmonized public
  callset.
- `ANCESTRY_CONTEXT`: optional self-reported context used only to select comparisons and caveats.
- `OUTPUT_DIR`: private local output directory.
- Tooling: `plink2`, PCA tooling, and ADMIXTURE or equivalent.

## Method

1. Convert local genome data to autosomal biallelic SNP genotypes with correct gVCF hom-ref handling.
2. Intersect with the reference panel on shared SNPs, harmonize alleles, exclude problematic sites,
   and LD-prune to an appropriate set of independent markers.
3. Run PCA projection against the reference panel and report nearest reference clusters with clear
   limitations.
4. If using supervised ADMIXTURE, predefine source groups from public population labels and report
   how labels were chosen.
5. Run sensitivity checks where feasible, such as different K values or alternate source groupings.
6. Treat small fractions as uncertain and potentially model noise.

## Output

Report:

- Reference panel and population labels.
- SNP counts and coverage.
- PCA placement.
- ADMIXTURE components, if used.
- Sensitivity checks.
- Plain-language summary with limitations.

## Caveats

ADMIXTURE components are model-dependent and reference-dependent. Small components can be noise.
Public reference panels often cannot resolve province-level or family-level ancestry.

## Reviewer Notes

Review for population-label assumptions, supervised-source definitions, small-component language,
and whether the prompt avoids overstating geographic precision.


---

**Disclaimer:** Educational and research use only — not medical advice, no warranty, no liability.
See [DISCLAIMER.md](../DISCLAIMER.md). Confirm any finding with a clinical-grade test and a qualified
professional before acting.
