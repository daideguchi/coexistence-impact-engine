# Gemini Proof Plan

## Current State

The app has browser-local Gemini BYOK call paths for policy drafting and Field Reality Check. The repo also includes a local Vertex AI smoke script that writes sanitized proof metadata only.

Current proof file is attached:

```text
media/gemini-live-policy-draft.json
```

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
  "prompt_purpose": "community governance policy draft + field reality check",
  "contains_secret": false,
  "sample_excerpt": "short sanitized excerpt",
  "field_reality_check_live_proof": true,
  "checks": [
    { "prompt_purpose": "community governance policy draft" },
    { "prompt_purpose": "field reality check" }
  ]
}
```

## Local Vertex Smoke Command

```bash
GOOGLE_VERTEX_SERVICE_ACCOUNT_JSON=/path/to/service-account.json \
GOOGLE_VERTEX_PROJECT=pj260519 \
GOOGLE_VERTEX_LOCATION=us-central1 \
GOOGLE_VERTEX_MODEL=gemini-2.5-flash \
node scripts/run_vertex_gemini_smoke.mjs
```

The script writes `media/gemini-live-policy-draft.json`. It must not print or commit the private key. The proof file may include sanitized excerpts and token counts, but never credentials.

## Safety Rules

- Do not commit API keys.
- Do not paste full raw provider responses if they contain metadata that should stay private.
- Do not claim XPRIZE readiness until Gemini proof, user evidence, and business evidence exist.
