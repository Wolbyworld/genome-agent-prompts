# UAT

Use only public synthetic fixtures.

## Verify Repository Safety

```bash
make verify
```

Expected: shell scripts pass syntax checks, public fixtures are small and synthetic, and the
private-content scanner reports no findings.

## Fixture Boundary

```bash
find fixtures/public -type f -maxdepth 2
```

Expected: only tiny synthetic files are present.

## Prompt Review Readiness

Open each prompt in `prompts/` and confirm it contains:

- Purpose.
- Inputs.
- Method.
- Output.
- Caveats.
- Reviewer notes.
