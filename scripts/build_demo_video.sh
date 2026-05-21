#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
FONT="/System/Library/Fonts/Supplemental/Arial.ttf"
EDGE_TTS_PYTHON="${EDGE_TTS_PYTHON:-python3.11}"
EDGE_TTS_VOICE="${EDGE_TTS_VOICE:-en-US-AvaNeural}"
EDGE_TTS_RATE="${EDGE_TTS_RATE:--6%}"
OUT="$ROOT/media/coexistence-impact-engine-demo.mp4"
DRAFT_OUT="$ROOT/media/coexistence-impact-engine-demo-draft.mp4"
TMP_DIR="$ROOT/media/.demo_video_tmp"

rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"

make_text_slide() {
  local title="$1"
  local subtitle="$2"
  local footer="$3"
  local out="$4"

  magick -size 1920x1080 xc:"#f4f7f6" \
    -fill "#18232c" -draw "rectangle 0,0 1920,250" \
    -fill "#166b65" -draw "rectangle 78,328 1842,358" \
    -fill "#ffffff" -font "$FONT" -pointsize 70 -annotate +82+146 "$title" \
    -fill "#e3f4f1" -font "$FONT" -pointsize 34 -annotate +86+216 "$subtitle" \
    -fill "#ffffff" -stroke "#d7e2df" -strokewidth 3 -draw "roundrectangle 120,420 1800,760 24,24" \
    -stroke none -fill "#18232c" -font "$FONT" -pointsize 42 -annotate +170+526 "$footer" \
    -fill "#5d6e7b" -font "$FONT" -pointsize 28 -annotate +170+650 "A public impact prototype with explicit Gemini, user, and business proof boundaries." \
    "$out"
}

make_screenshot_slide() {
  local src="$1"
  local title="$2"
  local subtitle="$3"
  local kicker="$4"
  local out="$5"

  magick "$src" \
    -resize 1920x \
    -crop 1920x1080+0+0 +repage \
    -fill "#10202ED9" -draw "rectangle 0,0 1920,164" \
    -fill "#000000CC" -draw "rectangle 0,790 1920,1080" \
    -font "$FONT" -fill "#BFE8FF" -pointsize 30 -annotate +72+64 "$kicker" \
    -font "$FONT" -fill white -pointsize 56 -annotate +72+126 "$title" \
    -font "$FONT" -fill white -pointsize 38 -annotate +72+900 "$subtitle" \
    "$out"
}

cat > "$TMP_DIR/narration.txt" <<'TEXT'
Coexistence Impact Engine is the long-game XPRIZE track for human and AI collaboration.

The simple problem is this: AI-assisted work can help communities, but people still need rules, explanations, human approval, and real evidence.

The intake starts with the community, the impact problem, the governance stance, the language, and the Gemini model.

The middle-school clear story explains who it helps, what hurts, and how the product helps.

The operating loop keeps the boundary clean. Gemini drafts policy and multilingual explanations. Humans approve enforcement, public claims, and final decisions.

The Gemini workbench can run a browser-local BYOK call, and the public repo now includes one sanitized Vertex AI Gemini proof file. It does not contain secrets.

The Field Reality Check is where AI is allowed to judge from the operator's seat. It separates a vague reaction from usable evidence, blocked claims, and the next thing to measure.

The evidence ledger and business path show what is real, what is pending, and what must be proven before XPRIZE submission: user evidence, impact metrics, and business evidence.

The new pilot trial workspace captures baseline minutes, trial minutes, reviewed decisions, policy outcomes, languages used, and an optional approved quote. Its time-saved formula stays at zero until a real operator enters real evidence.

This is not a final XPRIZE submission yet. It is an honest public foundation for turning AI coexistence into a measurable impact product.
TEXT

"$EDGE_TTS_PYTHON" -m edge_tts \
  --voice "$EDGE_TTS_VOICE" \
  --rate="$EDGE_TTS_RATE" \
  --file "$TMP_DIR/narration.txt" \
  --write-media "$TMP_DIR/narration.mp3"

make_text_slide \
  "Coexistence Impact Engine" \
  "Gemini-assisted governance for human-AI communities" \
  "AI coexistence needs policy, approval, explanation, and proof." \
  "$TMP_DIR/slide-0.png"

make_screenshot_slide "$ROOT/media/coexistence-impact-engine-pages-full.png" \
  "Impact Intake" \
  "Community, problem, stance, language, model, and BYOK Gemini path." \
  "1 / 7  Define the impact context" \
  "$TMP_DIR/slide-1.png"

make_screenshot_slide "$ROOT/media/coexistence-impact-engine-pages-full.png" \
  "Plain Story" \
  "Who it helps, what hurts, and how governance makes AI participation safer." \
  "2 / 7  Middle-school clear" \
  "$TMP_DIR/slide-2.png"

make_screenshot_slide "$ROOT/media/coexistence-impact-engine-pages-full.png" \
  "Human And AI Loop" \
  "Gemini drafts. Humans approve policy, enforcement, public claims, and final decisions." \
  "3 / 7  Human control boundary" \
  "$TMP_DIR/slide-3.png"

make_screenshot_slide "$ROOT/media/coexistence-impact-engine-pages-full.png" \
  "Gemini Workbench" \
  "A sanitized Vertex AI Gemini proof file is attached without committing secrets." \
  "4 / 7  Live Gemini proof, bounded claim" \
  "$TMP_DIR/slide-4.png"

make_screenshot_slide "$ROOT/media/coexistence-impact-engine-full.png" \
  "Field Reality Check" \
  "AI reasons from the operator's seat: signal, blocked claim, and next measurement." \
  "5 / 7  Situational judgment, not final validation" \
  "$TMP_DIR/slide-5.png"

make_screenshot_slide "$ROOT/media/coexistence-impact-engine-full.png" \
  "Pilot Trial Workspace" \
  "Capture baseline time, reviewed decisions, policy outcome, languages, and an approved quote." \
  "6 / 7  Real impact capture" \
  "$TMP_DIR/slide-6.png"

make_text_slide \
  "Honest Submission Boundary" \
  "Gemini proof is attached. Final XPRIZE readiness is not claimed." \
  "Next: one real operator trial, impact metrics, and business evidence." \
  "$TMP_DIR/slide-7.png"

ffmpeg -y \
  -loop 1 -t 13 -i "$TMP_DIR/slide-0.png" \
  -loop 1 -t 13 -i "$TMP_DIR/slide-1.png" \
  -loop 1 -t 13 -i "$TMP_DIR/slide-2.png" \
  -loop 1 -t 13 -i "$TMP_DIR/slide-3.png" \
  -loop 1 -t 13 -i "$TMP_DIR/slide-4.png" \
  -loop 1 -t 13 -i "$TMP_DIR/slide-5.png" \
  -loop 1 -t 13 -i "$TMP_DIR/slide-6.png" \
  -loop 1 -t 13 -i "$TMP_DIR/slide-7.png" \
  -i "$TMP_DIR/narration.mp3" \
  -filter_complex "[0:v][1:v][2:v][3:v][4:v][5:v][6:v][7:v]concat=n=8:v=1:a=0,format=yuv420p[v];[8:a]loudnorm=I=-16:TP=-1.5:LRA=11,volume=0.92[a]" \
  -map "[v]" -map "[a]" -r 30 -c:v libx264 -preset veryfast -crf 23 -c:a aac -b:a 192k -shortest -movflags +faststart "$OUT"

cp "$OUT" "$DRAFT_OUT"
rm -rf "$TMP_DIR"
echo "$OUT"
