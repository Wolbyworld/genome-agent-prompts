# Methodology

The prompts are structured as reusable workflow specifications. They ask an agent to show the work:
inputs, tools, versions, filters, coverage, reference panels, and limitations.

## Local-First Design

Private genome and medical data should remain on the user's machine. Remote lookups are appropriate
only for public identifiers, public guidelines, public databases, and tool documentation. Any transfer
of private variants or health records requires explicit approval from the data owner for that exact
transfer.

## gVCF and Allele Handling

Agents should not treat missing variant lines in a gVCF as missing data by default. For covered
reference blocks, a site may be homozygous reference. If a score's effect allele is the reference
allele, covered homozygous reference can mean dosage 2, not dosage 0. The prompt must require REF/ALT
resolution per site, build matching, normalization, and coverage reporting.

## PRS Standardization

PRS outputs should report score ID, scoring source, build, coverage, allele harmonization approach,
reference panel, raw score, percentile, z-score, and ancestry limitations. Dense genome-wide scores
should be standardized empirically against an appropriate reference distribution rather than using
an independence assumption that ignores linkage disequilibrium.

## Clinical and PGx Boundaries

Clinical variant triage and pharmacogenomics outputs are research-grade unless performed and
confirmed through clinical-grade pipelines. Prompts should separate pathogenic/likely pathogenic
findings, carrier findings, variants of uncertain significance, and weak evidence claims.
