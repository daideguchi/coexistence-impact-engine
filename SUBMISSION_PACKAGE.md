# Submission Package — Coexistence Impact Engine

## Title

Coexistence Impact Engine

## Short Description

A Gemini-assisted governance engine for communities where humans and AI work together, keeping humans in control while making policy, disclosure, multilingual explanation, and impact evidence easier to manage.

## Problem

AI-assisted participation is becoming normal. Communities and small teams need more than bans or blind trust. They need rules, explanations, review checklists, approval gates, and evidence of impact.

## Solution

Coexistence Impact Engine creates a reviewable impact packet:

- target community
- governance stance
- Gemini prompt for policy and multilingual explanation
- human/AI operating loop
- approval gates
- impact evidence ledger
- next live proof step
- claim boundary

## XPRIZE Fit

The long-game fit is an AI-assisted operations business for communities and teams that need responsible AI participation policies. Gemini is used where it is safest: drafting and summarizing policy artifacts. Humans keep control over enforcement, public claims, and final decisions.

## Current Proof

```text
node scripts/verify_impact.mjs
impact_verify_ok
sections=6

python3 scripts/verify_no_secrets.py
coexistence_impact_no_secrets_ok

python3 scripts/verify_gemini_boundary.py
coexistence_impact_gemini_boundary_ok
gemini_live_proof_file_exists=False
```

Screenshots:

```text
media/coexistence-impact-engine-full.png
media/coexistence-impact-engine-pages-full.png
```

Demo video draft:

```text
media/coexistence-impact-engine-demo.mp4
https://raw.githubusercontent.com/daideguchi/coexistence-impact-engine/main/media/coexistence-impact-engine-demo.mp4
```

This draft does not claim final XPRIZE readiness.

## Claim Boundary

This is not yet a final XPRIZE submission. Live Gemini proof, real user/community trials, and business evidence are still required.
