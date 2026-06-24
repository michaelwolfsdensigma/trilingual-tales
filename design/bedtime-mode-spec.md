# Nitean Bedtime Mode Visual Spec

Posted by Team 4 on 2026-06-24 14:19 (+07).

## Goal

Bedtime mode should make the reader feel quieter, warmer, and harder to wander away from. It is not a new screen. It is a visual state applied to the current reading flow.

## Token Mapping

Use `design/color-tokens.ts`.

| UI Surface | Day Token | Bedtime Token |
|------------|-----------|---------------|
| App background | `day.background` | `bedtime.background` |
| Page surface | `day.surface` | `bedtime.surface` |
| Secondary surface | `day.surfaceAlt` | `bedtime.surfaceAlt` |
| Primary controls | `day.primary` | `bedtime.primary` |
| Pressed controls | `day.primaryPressed` | `bedtime.primaryPressed` |
| Body text | `day.text` | `bedtime.text` |
| Supporting text | `day.textMuted` | `bedtime.textMuted` |
| Borders | `day.border` | `bedtime.border` |
| Reader tint | none | `bedtime.overlay` |
| Modal scrim | app default | `bedtime.scrim` |

## Reader Treatment

- Background changes to `bedtime.background`.
- Page text sits on `bedtime.surface`, never pure black.
- Reader image opacity: 82-88%.
- Apply a warm overlay using `bedtime.overlay` across the reader view.
- Keep text at full opacity above the overlay.
- Primary controls use `bedtime.primary`; secondary controls use `bedtime.secondary`.
- Borders should be subtle: `bedtime.border`, 1 px.

## Motion

- Reduce page transition duration to 120-160 ms.
- Disable decorative movement while bedtime mode is active.
- Keep tap feedback, but use opacity feedback instead of scale.
- Audio should continue normally; do not auto-start extra sound effects when toggling bedtime mode.

## Controls

- The bedtime toggle should remain reachable from the reader toolbar.
- Exit uses a parental lock button in the top right.
- Lock button target: at least 44 x 44 px.
- Lock button visual: compact, warm border, low contrast fill.
- PIN modal width: 300-340 px on phone, max 420 px on tablet/web.

## Copy

Use direct, calm copy. Avoid playful prompts.

- Modal title: `Exit Bedtime Mode?`
- Modal body: `Enter any 4 digits to exit.`
- Confirm: `Confirm`
- Cancel: `Cancel`

## Accessibility

- Text contrast should stay above 4.5:1 for story text.
- Do not dim Khmer text below full opacity.
- Preserve current font size or increase by 1 px in bedtime mode if the screen feels dense.
- Touch targets: 44 x 44 px minimum.

## Demo Acceptance

- Toggle bedtime mode from a story page.
- Screen visibly warms and darkens without hiding the illustration.
- Story text remains legible in Khmer, English, and French.
- Audio controls remain available.
- Exiting bedtime mode opens the parental lock modal.
- Entering any 4 digits exits bedtime mode.
