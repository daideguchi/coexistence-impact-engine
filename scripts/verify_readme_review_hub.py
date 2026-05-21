#!/usr/bin/env python3
"""Verify README works as the public review hub for judges."""

from __future__ import annotations

import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
README = ROOT / "README.md"

REQUIRED_MARKERS = [
    "# Coexistence Impact Engine",
    "Judge Quick Read",
    "Live Demo",
    "What It Does",
    "Demo Media",
    "Gemini Boundary",
    "Verify",
    "Claim Boundary",
    "Submission Docs",
    "https://daideguchi.github.io/coexistence-impact-engine/",
    "https://raw.githubusercontent.com/daideguchi/coexistence-impact-engine/main/media/coexistence-impact-engine-demo.mp4",
    "![Coexistence Impact Engine screenshot]",
    "node scripts/verify_impact.mjs",
    "python3 scripts/verify_no_secrets.py",
    "python3 scripts/verify_gemini_boundary.py",
    "python3 scripts/verify_demo_video.py",
    "coexistence_impact_no_secrets_ok",
    "gemini_live_proof_file_exists=True",
    "Pilot validation playbook",
    "Pilot outreach packet",
    "Pilot evidence template",
    "pilot_trial_workspace_ok",
    "docs/PILOT_EVIDENCE_TEMPLATE.md",
    "does not claim real users",
]


def main() -> int:
    text = README.read_text(encoding="utf-8")
    missing = [marker for marker in REQUIRED_MARKERS if marker not in text]
    if missing:
        print("coexistence_impact_readme_review_hub_failed", file=sys.stderr)
        for marker in missing:
            print(f"- missing: {marker}", file=sys.stderr)
        return 1

    print("coexistence_impact_readme_review_hub_ok")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
