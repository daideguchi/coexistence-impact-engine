# Coexistence Impact Engine

Hackathon target: Build with Gemini XPRIZE

## Product Thesis

AI coexistence is not just a moderation problem. It is an impact and governance problem.

Coexistence Impact Engine helps communities and small teams govern AI-assisted participation with clear policy, multilingual explanation, human approval gates, and measurable evidence.

## Live Demo

GitHub Pages target:

```text
https://daideguchi.github.io/coexistence-impact-engine/
```

## What It Does

- explains the target user, problem, and solution in plain language
- builds a human/AI operating loop
- drafts a Gemini prompt for policy, disclosure, review checklist, and user explanation
- supports browser-local Gemini BYOK testing without saving secrets
- exports an impact packet with evidence ledger and claim boundaries
- keeps live Gemini proof, user proof, and business evidence blocked until real evidence exists

## Demo Media

Current local verification screenshot:

![Coexistence Impact Engine screenshot](media/coexistence-impact-engine-full.png)

GitHub Pages screenshot target:

```text
media/coexistence-impact-engine-pages-full.png
```

Current demo video draft:

```text
media/coexistence-impact-engine-demo.mp4
https://raw.githubusercontent.com/daideguchi/coexistence-impact-engine/main/media/coexistence-impact-engine-demo.mp4
```

This is a narration draft for review. It does not claim final XPRIZE readiness.

## Gemini Boundary

The app includes a browser-local Gemini `generateContent` path using a user-supplied API key and the default model field `gemini-2.5-flash`.

No API key is committed, stored, or bundled.

This public package now includes one sanitized live Gemini proof file:

```text
media/gemini-live-policy-draft.json
```

The proof shows one Vertex AI Gemini policy-draft call. Real users, impact metrics, revenue, and final XPRIZE readiness are not claimed yet.

## Verify

```bash
node scripts/verify_impact.mjs
python3 scripts/verify_no_secrets.py
python3 scripts/verify_gemini_boundary.py
python3 scripts/verify_demo_video.py
```

Optional live Gemini proof command:

```bash
GOOGLE_VERTEX_SERVICE_ACCOUNT_JSON=/path/to/service-account.json \
GOOGLE_VERTEX_PROJECT=pj260519 \
GOOGLE_VERTEX_LOCATION=us-central1 \
GOOGLE_VERTEX_MODEL=gemini-2.5-flash \
node scripts/run_vertex_gemini_smoke.mjs
```

Expected current state:

```text
impact_verify_ok
cards=18
coexistence_impact_no_secrets_ok
coexistence_impact_gemini_boundary_ok
gemini_live_proof_file_exists=True
impact_demo_video_ok
```

## Claim Boundary

This is a public impact prototype, not a final XPRIZE submission. It claims one live Gemini policy-draft proof file only. It does not claim real users, revenue, impact metrics, or final submission readiness yet.

## Submission Docs

- [Submission package](SUBMISSION_PACKAGE.md)
- [Architecture](ARCHITECTURE.md)
- [XPRIZE Gemini proof plan](docs/GEMINI_PROOF_PLAN.md)
- [Devpost draft](submission/devpost-draft.md)
- [Build journey](submission/build-journey.md)
