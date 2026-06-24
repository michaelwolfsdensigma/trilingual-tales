# Team 4 — Design + Brand + Bedtime UX

**Branch:** `team/4-design`  
**Stack:** Figma, PNG exports, color token file (TypeScript)

---

## Current Status

| Item | Status |
|------|--------|
| Overall | `NOT STARTED` |
| Working name agreed | `PENDING — whole group at T+0:00` |
| One-line tagline (KM / EN / FR) | `PENDING` |
| Daytime color palette | `PENDING` |
| Bedtime color palette | `PENDING` |
| Color tokens exported (TS file) | `PENDING` |
| Typography pairing specified | `PENDING` |
| Story cover template (PNG) | `PENDING` |
| Bedtime mode visual spec (written + Figma) | `PENDING` |
| App icon (all required sizes) | `PENDING` |
| Splash screen | `PENDING` |
| Figma prototype (full reading flow) | `PENDING` |

---

## Deliverables for Other Teams

| Deliverable | Needed by | Due | Status |
|-------------|-----------|-----|--------|
| Color tokens (TS export) | Team 1 | T+0:30 | `PENDING` |
| Story cover template + dimensions | Team 2 | T+1:00 | `PENDING` |
| Bedtime mode visual spec | Team 1 | T+1:30 | `PENDING` |
| App icon + splash (PNG exports) | Team 1 | T+3:00 | `PENDING` |
| Figma prototype link | Demo | T+4:00 | `PENDING` |

---

## Needs from Other Teams

| Need | From | Status |
|------|------|--------|
| Working name confirmed | Whole group | `DONE — Nitean` |
| Expo screen dimensions (for icon spec) | Team 1 | `DONE — see below` |

---

## Brand Direction Notes

*(To be filled in by Team 4 during the build — record decisions here for future sessions)*

**Working name:** —  
**Feeling / tone:** Warm, calm, grounded, culturally rooted — not bright or gamified  
**Daytime mode:** —  
**Bedtime mode:** Dark amber / warm brass / near-black. Screen-calming. Low animation.  
**Typography note:** Noto Sans Khmer is locked in (already in the tech stack). Pair it with a warm Latin face.

---

## Expo Icon + Splash Dimensions (from Team 1)

All assets go in `app/assets/`. Paths are already wired in `app.json` — just drop the PNGs in.

| File | Size | Notes |
|------|------|-------|
| `icon.png` | **1024 × 1024 px** | iOS App Store icon. Square, no transparency, no rounded corners (iOS applies its own mask). Used as fallback on all platforms. |
| `android-icon-foreground.png` | **1024 × 1024 px** | Adaptive icon foreground. Keep the actual artwork within the **central 676 × 676 px** safe zone — the outer ring gets masked to circle/squircle by the launcher. Transparent background. |
| `android-icon-background.png` | **1024 × 1024 px** | Adaptive icon background layer. Can be a solid fill or subtle texture. Current placeholder color: `#E6F4FE` (override with Nitean palette — suggest `#FFF8EA` daytime background). |
| `android-icon-monochrome.png` | **1024 × 1024 px** | Android 13+ themed icon (Material You). Single-colour silhouette, white on transparent. Same safe-zone rule as foreground. |
| `favicon.png` | **48 × 48 px** | Web only. Simple mark — the full wordmark won't read at this size. |

**Splash screen** is not yet configured in `app.json`. If Team 4 wants a branded splash, add an asset and let Team 1 know — we'll wire it in. Suggested size: **1284 × 2778 px** (iPhone Pro Max @3x, centred artwork, solid Nitean background fills the rest).

**No transparency on `icon.png`** — the App Store rejects icons with alpha.

---

## Progress Log

*(Append timestamped entries below as work proceeds. Do not edit previous entries.)*

---
