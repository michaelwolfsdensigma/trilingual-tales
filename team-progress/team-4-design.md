# Team 4 — Design + Brand + Bedtime UX

**Branch:** `team/4-design`  
**Stack:** Figma, PNG exports, color token file (TypeScript)

---

## Current Status

| Item | Status |
|------|--------|
| Overall | `DONE — design polish deliverables posted` |
| Working name agreed | `DONE — Nitean posted to INTEGRATION.md` |
| One-line tagline (KM / EN / FR) | `DONE — posted to INTEGRATION.md` |
| Daytime color palette | `DONE` |
| Bedtime color palette | `DONE` |
| Color tokens exported (TS file) | `DONE — design/color-tokens.ts` |
| Typography pairing specified | `DONE — Noto Sans Khmer + warm Latin fallback` |
| Story cover template (PNG) | `DONE — design/exports/story-cover-template.png` |
| Bedtime mode visual spec (written + Figma) | `DONE — design/bedtime-mode-spec.md + HTML prototype` |
| App icon (all required sizes) | `DONE — app/assets + design/exports` |
| Splash screen | `DONE — app/assets/splash-icon.png + design reference` |
| Figma prototype (full reading flow) | `DONE — HTML prototype at design/prototype/index.html` |

---

## Deliverables for Other Teams

| Deliverable | Needed by | Due | Status |
|-------------|-----------|-----|--------|
| Color tokens (TS export) | Team 1 | T+0:30 | `DONE — design/color-tokens.ts + INTEGRATION.md` |
| Story cover template + dimensions | Team 2 | T+1:00 | `DONE — design/story-cover-template.md` |
| Bedtime mode visual spec | Team 1 | T+1:30 | `DONE — design/bedtime-mode-spec.md` |
| App icon + splash (PNG exports) | Team 1 | T+3:00 | `DONE — app/assets/* + design/asset-manifest.md` |
| Figma prototype link | Demo | T+4:00 | `DONE — design/prototype/index.html` |

---

## Needs from Other Teams

| Need | From | Status |
|------|------|--------|
| Working name confirmed | Whole group | `DONE — Nitean locked in INTEGRATION.md` |
| Expo screen dimensions (for icon spec) | Team 1 | `RESOLVED — used Expo defaults from app/app.json on Team 1 branch` |

---

## Brand Direction Notes

*(To be filled in by Team 4 during the build — record decisions here for future sessions)*

**Working name:** Nitean
**Feeling / tone:** Warm, calm, grounded, culturally rooted — not bright or gamified  
**Daytime mode:** Warm paper, brass primary, deep ink text, teal support, lacquer/clay accent.
**Bedtime mode:** Near-black umber, warm brass controls, amber text, low-contrast teal/accent only where needed. Screen-calming. Low animation.
**Typography note:** Noto Sans Khmer is locked in (already in the tech stack). Pair it with a warm Latin face; recommended first pass is Noto Sans Khmer + Nunito Sans or Lora for display/title use only.

---

## Expo Icon + Splash Dimensions (from Team 1)

All assets go in `app/assets/`. Paths are already wired in `app.json` — Team 4 exports are now posted.

| File | Size | Notes |
|------|------|-------|
| `icon.png` | **1024 × 1024 px** | iOS App Store icon. Square, no transparency, no rounded corners. Used as fallback on all platforms. |
| `android-icon-foreground.png` | **1024 × 1024 px** | Adaptive icon foreground. Artwork kept inside the central safe zone. Transparent background. |
| `android-icon-background.png` | **1024 × 1024 px** | Adaptive icon background layer using the Nitean bedtime background. |
| `android-icon-monochrome.png` | **1024 × 1024 px** | Android 13+ themed icon. White silhouette on transparent. |
| `favicon.png` | **48 × 48 px** | Web favicon. |
| `splash-icon.png` | **1024 × 1024 px** | Expo splash icon asset. |

Reference splash composition: `design/exports/nitean-splash-1242x2436.png`.

---

## Progress Log

*(Append timestamped entries below as work proceeds. Do not edit previous entries.)*

---

### 2026-06-24 12:55 (+07)

- Read `team-progress/README.md`, `team-progress/team-4-design.md`, and `team-progress/INTEGRATION.md` in protocol order.
- Reviewed the whitepaper brand note: "Trilingual Tales" is descriptive but generic; product should use a warmer Khmer-rooted name and keep trilingual as tagline/value prop.
- Posted working name **Nitean** plus KM/EN/FR tagline to `INTEGRATION.md`.
- Finalized day and bedtime color tokens, preserving Team 1's amber foundation while adding teal and lacquer accents for a less one-note palette.
- Exported tokens in `design/color-tokens.ts` for Team 1 to copy into app constants.
- Resolved BLK-002 because working name and color tokens are now posted.

**Next Team 4 work:** story cover template dimensions/spec for Team 2, then bedtime mode visual spec for Team 1.

### 2026-06-24 14:19 (+07)

- Re-read `team-progress/README.md`, `team-progress/team-4-design.md`, and `team-progress/INTEGRATION.md`; fetched latest `origin/main` and merged current coordination state.
- Published bedtime mode visual spec at `design/bedtime-mode-spec.md` for Team 1, including token mapping, motion rules, lock modal behavior, accessibility, and demo acceptance.
- Published story cover template contract at `design/story-cover-template.md`; exported `design/exports/story-cover-template.png` at 1200 x 900.
- Exported Expo-ready app assets into `app/assets/`: `icon.png`, `android-icon-background.png`, `android-icon-foreground.png`, `android-icon-monochrome.png`, `splash-icon.png`, and `favicon.png`.
- Added design export manifest at `design/asset-manifest.md` and generated reference assets in `design/exports/`.
- Added clickable HTML prototype at `design/prototype/index.html` as the demo backup artifact in place of a hosted Figma link.
- Updated `INTEGRATION.md`, `README.md`, and `BLOCKERS.md` so other teams know Team 4 deliverables are ready.

**Team 4 status:** all promised Build'o'thon design deliverables are complete. Remaining changes should be integration support only.
