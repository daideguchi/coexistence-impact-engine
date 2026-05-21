# Coexistence Impact Engine

Hackathon target: Build with Gemini XPRIZE

## Product Thesis

AI coexistence is not just a moderation problem. It is an impact and governance problem.

Coexistence Impact Engine helps communities and small teams govern AI-assisted participation with clear policy, multilingual explanation, human approval gates, and measurable evidence.

## Judge Quick Read

Who it helps: communities, moderators, and small organizations where humans and AI will work in the same space.

The problem: the hard question is not only whether AI was involved. The hard question is how people set rules, explain decisions, approve risky steps, support multiple languages, and measure whether the workflow helped.

How Coexistence Impact Engine solves it: the app creates a human/AI operating loop, Gemini policy-draft prompt, multilingual explanation path, Field Reality Check, human approval gates, pilot trial workspace, evidence ledger, and exportable impact packet.

What is proven now: the public app, screenshots, demo video draft, no-secret verifier, Gemini boundary verifier, pilot evidence calculator, and one sanitized live Vertex AI Gemini proof file for policy drafting and Field Reality Check are live. Real users, impact metrics, revenue, and final XPRIZE readiness are not claimed yet.

Early feedback: one informal reviewer understood the value quickly and responded positively. This is treated as an initial signal only, not formal validation. The next milestone is to turn that "this feels useful" reaction into measured pilot evidence.

## Live Demo

GitHub Pages target:

```text
https://daideguchi.github.io/coexistence-impact-engine/
```

## What It Does

- explains the target user, problem, and solution in plain language
- builds a human/AI operating loop
- drafts a Gemini prompt for policy, disclosure, review checklist, and user explanation
- adds a Field Reality Check so AI can reason from the operator's seat without making final claims
- supports browser-local Gemini BYOK testing without saving secrets
- creates a pilot validation kit for the first real community trial
- creates a pilot outreach kit for recruiting one real operator without private data
- creates a pilot trial workspace for baseline minutes, reviewed decisions, accepted policy text, languages used, optional operator quote, and estimated time saved
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

The Field Reality Check is the intended place for AI judgment. Gemini may role-play the field operator and classify whether a note is usable evidence, an overclaim risk, or a next measurement question. It must not become a final enforcement decision, an authorship detector, or a substitute for human-approved public proof.

This public package now includes one sanitized live Gemini proof file:

```text
media/gemini-live-policy-draft.json
```

The proof shows Vertex AI Gemini calls for policy drafting and Field Reality Check. Real users, impact metrics, revenue, and final XPRIZE readiness are not claimed yet.

## Verify

```bash
node scripts/verify_impact.mjs
python3 scripts/verify_no_secrets.py
python3 scripts/verify_readme_review_hub.py
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
cards=38
pilot_trial_workspace_ok
field_reality_check_ok
coexistence_impact_no_secrets_ok
coexistence_impact_readme_review_hub_ok
coexistence_impact_gemini_boundary_ok
gemini_live_proof_file_exists=True
field_reality_check_live_proof=True
impact_demo_video_ok
```

## Claim Boundary

This is a public impact prototype, not a final XPRIZE submission. It claims one live Gemini proof file for policy drafting and Field Reality Check, plus one informal early-feedback signal only. It does not claim real users, a formal pilot, broad user validation, revenue, impact metrics, or final submission readiness yet.

## Submission Docs

- [Submission package](SUBMISSION_PACKAGE.md)
- [Architecture](ARCHITECTURE.md)
- [XPRIZE Gemini proof plan](docs/GEMINI_PROOF_PLAN.md)
- [Pilot validation playbook](docs/PILOT_VALIDATION_PLAYBOOK.md)
- [Pilot outreach packet](docs/PILOT_OUTREACH_PACKET.md)
- [Pilot evidence template](docs/PILOT_EVIDENCE_TEMPLATE.md)
- [Devpost draft](submission/devpost-draft.md)
- [Build journey](submission/build-journey.md)
