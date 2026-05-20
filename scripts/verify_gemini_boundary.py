#!/usr/bin/env python3
"""Keep Gemini live-proof claims blocked until a real proof file exists."""

from __future__ import annotations

import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
PROOF = ROOT / "media" / "gemini-live-policy-draft.json"
TEXT_FILES = [
    ROOT / "README.md",
    ROOT / "SUBMISSION_PACKAGE.md",
    ROOT / "submission" / "devpost-draft.md",
]
UNSAFE = [
    "live gemini proof complete",
    "gemini proof attached",
    "xprize submission ready",
]


def main() -> int:
    combined = "\n".join(path.read_text(encoding="utf-8").lower() for path in TEXT_FILES)
    if not PROOF.exists():
        for phrase in UNSAFE:
            if phrase in combined:
                print("coexistence_impact_gemini_boundary_failed")
                print(f"unsafe_phrase={phrase}")
                return 1
        print("coexistence_impact_gemini_boundary_ok")
        print("gemini_live_proof_file_exists=False")
        return 0

    data = json.loads(PROOF.read_text(encoding="utf-8"))
    required = ["provider", "model", "ran_at_utc", "prompt_purpose", "contains_secret", "sample_excerpt"]
    missing = [key for key in required if key not in data]
    if missing or data.get("contains_secret") is not False:
        print("coexistence_impact_gemini_boundary_failed")
        print(f"missing_or_invalid={missing}")
        return 1
    print("coexistence_impact_gemini_boundary_ok")
    print("gemini_live_proof_file_exists=True")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
