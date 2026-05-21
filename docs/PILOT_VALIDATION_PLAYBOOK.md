# Pilot Validation Playbook

This project should not claim real-world impact until one honest trial produces evidence.

## Goal

Run a small community or team pilot where Coexistence Impact Engine helps people create AI participation rules, disclosure text, review criteria, and multilingual explanations.

## Good First Pilot Targets

- subreddit or forum moderators
- classroom or study community
- open-source maintainer group
- multilingual support community
- small organization using AI-assisted work internally

## Before Baseline

Record the current state before using the tool:

- average time to write or revise AI participation rules
- number of unclear moderation or governance decisions
- number of repeated explanation messages
- languages that require support
- user questions or disputes caused by unclear AI policy

## Trial Steps

1. Fill the Impact Intake in the public app.
2. Build the Impact Packet.
3. Run Field Reality Check on any vague note, feedback, or proposed public claim.
4. Review the Gemini prompt and policy draft route.
5. Human operator approves or edits the policy.
6. Fill the Pilot Trial Workspace with baseline minutes, trial minutes, reviewed decisions, policy outcome, languages used, and any approved quote.
7. Use the packet for a small batch of real decisions or explanations.
8. Record what changed after the pilot.

Use `docs/PILOT_OUTREACH_PACKET.md` to recruit the first operator and collect only non-private evidence.
Use `docs/PILOT_EVIDENCE_TEMPLATE.md` to turn that trial into safe public proof.

## After Evidence

Useful evidence includes:

- policy drafts accepted by the team
- minutes saved per decision or explanation
- reviewed decisions using the checklist
- disputes avoided or resolved
- multilingual explanations sent
- qualitative feedback from the operator
- estimated time saved using `max(0, baseline minutes - trial minutes) x reviewed decisions`

## Handling Informal Feedback

If the first reaction is simply positive, do not overstate it. A response like "this is good" is useful as an early signal that the problem and workflow are understandable, but it is not a formal pilot result. If the operator refuses to share details with AI, respect that boundary and record only a privacy-respecting positive signal.

Record it as:

- the person understood the value without a long explanation
- the reaction was positive but not measured
- details were withheld, if the operator did not want to share them
- standard/default values are placeholders, not measured impact
- the next step is to capture real before/after workflow evidence

The Field Reality Check should help with this exact separation. It may act as the field operator and say what the note suggests, what it does not prove, and what should be measured next. It must not replace human approval of the final public claim.

## Stoplines

- Do not claim broad impact from a single anecdote.
- Do not present a casual positive reaction as formal validation.
- Do not turn withheld details or standard/default values into measured evidence.
- Do not present AI field judgment as final validation.
- Do not include private user data in public proof.
- Do not claim the tool detects AI authorship.
- Do not claim final XPRIZE readiness until impact evidence and business evidence exist.
