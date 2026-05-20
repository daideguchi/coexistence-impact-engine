# Gemini Proof Plan

## Current State

The app has a browser-local Gemini BYOK call path, but this repository does not include secrets and does not claim live Gemini proof yet.

## Proof File

Attach this file only after a real call:

```text
media/gemini-live-policy-draft.json
```

Required shape:

```json
{
  "provider": "google_gemini",
  "model": "gemini-2.5-flash",
  "ran_at_utc": "2026-05-20T00:00:00Z",
  "prompt_purpose": "community governance policy draft",
  "contains_secret": false,
  "sample_excerpt": "short sanitized excerpt"
}
```

## Safety Rules

- Do not commit API keys.
- Do not paste full raw provider responses if they contain metadata that should stay private.
- Do not claim XPRIZE readiness until Gemini proof, user evidence, and business evidence exist.
