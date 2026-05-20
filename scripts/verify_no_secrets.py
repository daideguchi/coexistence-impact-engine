#!/usr/bin/env python3
"""Fail if obvious API-key material is committed to the public prototype."""

from __future__ import annotations

import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
TEXT_EXTENSIONS = {".html", ".md", ".js", ".mjs", ".py", ".json"}
PATTERNS = [
    re.compile(r"AIza[0-9A-Za-z_-]{20,}"),
    re.compile(r"AQ\\.Ab8[0-9A-Za-z_-]{20,}"),
    re.compile(r"sk-[0-9A-Za-z_-]{20,}"),
]


def main() -> int:
    failures: list[str] = []
    for path in ROOT.rglob("*"):
        if not path.is_file() or path.suffix not in TEXT_EXTENSIONS or ".git" in path.parts:
            continue
        text = path.read_text(encoding="utf-8", errors="ignore")
        for pattern in PATTERNS:
            if pattern.search(text):
                failures.append(str(path.relative_to(ROOT)))
    if failures:
        print("coexistence_impact_no_secrets_failed")
        for failure in failures:
            print(f"- {failure}")
        return 1
    print("coexistence_impact_no_secrets_ok")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
