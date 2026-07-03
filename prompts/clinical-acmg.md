# Clinical Variant Safety Pass

## Purpose

Perform a genome-wide clinical variant triage with emphasis on medically actionable genes, ClinVar
pathogenic/likely pathogenic variants, carrier findings, and notable variants of uncertain
significance. Do not assume prior findings.

## Inputs

- `GENOME_SOURCE`: local VCF or gVCF.
- `BUILD`: genome build, such as `GRCh38`.
- `OUTPUT_DIR`: private local output directory.
- `ANCESTRY_CONTEXT`: optional context used only for limitations and interpretation caveats.
- Tooling: OpenCRAVAT/OakVar or another mature local annotation pipeline, plus `bcftools` and a
  matching reference FASTA.

## Method

1. Pre-process locally: extract variant sites, keep appropriate quality filters, normalize,
   left-align, and split multiallelics against the matching reference FASTA.
2. Run local annotation with ClinVar, ClinGen, OMIM, gnomAD, CADD, dbNSFP, SpliceAI if available,
   InterVar or equivalent ACMG/AMP support, PharmGKB if relevant, and any cancer/somatic resources
   only when clearly labeled as contextual rather than diagnostic.
3. Confirm each configured module actually ran and record tool and module versions.
4. Review current ACMG secondary findings genes using the current official list. Separate
   dominant-actionable findings from recessive carrier findings and apply gene-specific reporting
   rules.
5. Genome-wide, list ClinVar pathogenic/likely pathogenic variants with adequate review status,
   grouped by personal-risk versus carrier interpretation.
6. Flag high-impact loss-of-function or canonical-splice variants in disease genes as notable VUS
   only when the evidence supports that framing.

## Output

Produce concise tables for:

- Actionable findings: gene, variant, HGVS if available, zygosity, source classification, review
  status, condition, inheritance, and confirmation requirement.
- Carrier findings.
- Notable VUS with evidence and reason for uncertainty.
- Coverage, no-call, annotation, and filtering caveats.

## Caveats

This is research-grade triage. Any serious or actionable finding requires confirmation by a
clinical-grade test and review by qualified genetics professionals before action.

## Reviewer Notes

Review for ACMG list currency, inheritance framing, VUS overclaiming, ClinVar review-status
thresholds, and whether recessive carrier findings are clearly separated from personal-risk
findings.
