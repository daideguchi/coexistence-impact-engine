# Architecture — Coexistence Impact Engine

## Current MVP

```text
index.html
  impact intake
  deterministic impact-packet builder
  Gemini prompt builder
  browser-local Gemini BYOK call
  human/AI operating loop
  evidence ledger
  JSON packet export
  explicit claim boundary

scripts/verify_impact.mjs
  opens the app in Chrome
  verifies the story, loop, prompt, evidence ledger, and packet boundary
  captures screenshot

scripts/verify_no_secrets.py
  fails if obvious API-key material is committed

scripts/verify_gemini_boundary.py
  keeps live Gemini claims blocked until media/gemini-live-policy-draft.json exists
```

## Gemini Use

Gemini is used only for drafting and summarizing governance artifacts:

- AI participation policy
- disclosure request text
- moderator/team review checklist
- user-facing explanation
- human approval warning

Gemini is not used to secretly identify AI authorship, replace moderators, or make final enforcement decisions.

## Live Proof Step

The next real step is:

1. Run one browser-local Gemini `generateContent` call with a valid key.
2. Save sanitized response metadata and a short generated excerpt under `media/gemini-live-policy-draft.json`.
3. Re-run the boundary verifier.
4. Update README and submission copy only after proof exists.
