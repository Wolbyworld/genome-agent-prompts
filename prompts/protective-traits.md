# Protective and Benign Trait Scan

## Purpose

Scan for established protective variants and benign single-variant traits, reporting presence,
zygosity, and evidence strength without implying that absence is harmful.

## Inputs

- `GENOME_SOURCE`: local VCF or gVCF.
- `BUILD`: genome build, such as `GRCh38`.
- `OUTPUT_DIR`: private local output directory.
- Optional marker list with rsIDs, coordinates, alleles, expected effect direction, and evidence
  source.

## Method

1. Query each marker by rsID and, where possible, by coordinate plus REF/ALT allele.
2. For indels, match the variant explicitly rather than relying on rsID alone.
3. Resolve gVCF reference blocks and no-calls separately.
4. Report genotype, zygosity, present/absent status, evidence source, and effect caveat.
5. Add established protective variants only when the source and effect allele are clear.
6. Avoid polygenic education, intelligence, personality, or behavioral interpretations in this scan.

## Output

Produce a table with:

- Variant.
- Gene or locus.
- Effect allele.
- Sample genotype.
- Zygosity.
- Evidence strength.
- Plain-language interpretation.
- Caveat.

## Caveats

Most people lack most protective variants. Single-variant effects can be small, context-dependent, or
population-specific. This prompt is for interest and evidence review, not medical action.

## Reviewer Notes

Review for marker validity, effect-allele correctness, indel handling, overstatement of protection,
and whether weak claims are labeled clearly.


---

**Disclaimer:** Educational and research use only — not medical advice, no warranty, no liability.
See [DISCLAIMER.md](../DISCLAIMER.md). Confirm any finding with a clinical-grade test and a qualified
professional before acting.
