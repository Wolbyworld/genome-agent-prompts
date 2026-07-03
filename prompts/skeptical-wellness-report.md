# Skeptical Wellness Genetics Report

## Purpose

Produce a consumer-style wellness genetics report that grades evidence honestly and explicitly
labels weak or non-credible claims instead of converting them into recommendations.

## Inputs

- `GENOME_SOURCE`: local VCF or gVCF.
- `BUILD`: genome build, such as `GRCh38`.
- `OUTPUT_DIR`: private local output directory.
- Optional marker catalog with variant, gene, effect allele, evidence grade, and source.

## Method

1. Group items by category, such as nutrition, micronutrients, sleep, detox claims, athletic
   performance, and hormones.
2. For each marker, resolve genotype by rsID and coordinate where possible, including REF/ALT and
   gVCF reference-block handling.
3. Assign an evidence grade: Strong, Moderate, Weak, or Not credible.
4. Provide a sensible takeaway only for Strong or Moderate items.
5. Explicitly label non-credible categories, including unvalidated claims about detox, mold,
   nonspecific methylation, heavy metals, or similar wellness-marketing categories.
6. State where measured biomarkers or clinical testing are more informative than genotype.

## Output

Produce one table per category:

- Marker or gene.
- Genotype.
- Plain-language read.
- Evidence grade.
- Takeaway if warranted.
- Reason weak or non-credible claims should be ignored.

End with a short "what to ignore" list for Not credible items.

## Caveats

Wellness genetics is one of the least validated areas of consumer genetics. Most diet and supplement
claims are weak, non-actionable, or better answered by measured biomarkers.

## Reviewer Notes

Review for evidence grading, non-credible claim handling, supplement overclaiming, and whether the
prompt prevents weak associations from becoming advice.
