# Contributing

This repository is optimized for expert critique of prompt methodology, not for collecting personal
genetic results.

This project is educational and research-only. It is not medical advice and carries no warranty or
liability. By contributing you agree your contributions are offered on the same terms — see the
[LICENSE](LICENSE) and [DISCLAIMER.md](DISCLAIMER.md).

## Review Standards

When proposing a change, include:

- The exact prompt and section.
- The source of authority: guideline, documentation, paper, benchmark, or reproducible tool behavior.
- The certainty level: established, likely, uncertain, or speculative.
- The failure mode: privacy leak, overclaim, wrong tool, missing caveat, weak evidence, or
  reproducibility gap.
- Replacement wording or a minimal diff.

## Data Rules

- Do not attach private genome files, medical records, generated dashboards, OpenCRAVAT databases, or
  personal result tables.
- Use only `fixtures/public/` or tiny synthetic examples in issues and pull requests.
- Redact sample identifiers, local paths, phenotypes, and clinical findings before quoting logs.
- Keep discussion focused on methods and prompt wording.

## Pull Requests

Pull requests should:

- Run `make verify`.
- Avoid adding runtime dependencies unless the verification path stays lightweight.
- Update prompt wording and documentation together when behavior changes.
- Preserve the local-first and non-diagnostic safety boundary.
