# Prompt Design Notes

Each prompt should have the same reviewable shape:

1. Purpose.
2. Inputs.
3. Method.
4. Output.
5. Caveats.
6. Reviewer notes.

Good prompts name expected tools and evidence standards, but they should not hard-code private paths,
personal traits, previous result values, or local machine state. Public prompts should be reusable
templates that a user can parameterize locally.

Prefer explicit refusal or downranking language for weak evidence. A prompt that asks for a report
should also ask for evidence grades, uncertainty, and method provenance.
