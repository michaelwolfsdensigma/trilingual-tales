# Trilingual Tales

A React Native / Expo children's story app — Khmer, English, and French narrated tales for the 0–3 developmental band. Built for diaspora parents who want a bedtime ritual, not just another reading tool.

---

## Build'o'thon Branch Structure

| Branch | Owner | Scope |
|--------|-------|-------|
| `main` | Everyone | Stable — merge at each integration checkpoint |
| `team/1-app` | Team 1 | Expo app shell, reader, audio, bedtime mode |
| `team/2-content` | Team 2 | Folk tale texts, translations, audio files, seed data |
| `team/3-backend` | Team 3 | Supabase schema, RLS, auth, mock subscription |
| `team/4-design` | Team 4 | Assets, color tokens, icon, Figma exports |

## Stack

- **Frontend:** React Native + Expo SDK (iOS, Android, Web)
- **Backend:** Supabase (Postgres + Auth + Storage)
- **Audio:** Expo AV
- **Fonts:** Noto Sans Khmer (via @expo-google-fonts)
- **Subscriptions:** Mock state (is_premium toggle in Supabase Studio)

## Quick Start (Team 1)

```bash
cd app
npx create-expo-app . --template blank-typescript
npx expo install @expo-google-fonts/noto-sans-khmer expo-av expo-router
```

## Integration Checkpoints

| Time | Milestone |
|------|-----------|
| T+0:00 | Data model locked · Supabase live · Working name chosen |
| T+0:15 | Team 3 shares credentials |
| T+0:30 | Teams split |
| T+1:30 | Seed SQL delivered · Khmer font verified on device |
| T+2:30 | Team 1 connects to real Supabase data |
| T+3:00 | Final audio files uploaded |
| T+4:00 | Full integration + design assets |
| T+4:30 | Demo prep |
| T+5:00 | Demo |

## The Demo Script

A parent opens the app at 8pm. They pick **French**. They find a Khmer folk tale at their child's stage. They tap play — narration starts in French. They switch language mid-story to **Khmer**. They toggle **bedtime mode** — the screen warms, animations calm. They try a locked story, see the freemium gate, "subscribe" (admin toggle), it unlocks.

That is the complete demo. No quiz. No coloring. No hardware device.

## Repo Layout

```
/app          — Expo React Native project (Team 1)
/content      — Folk tale texts, translations, seed SQL (Team 2)
/backend      — Supabase schema migrations (Team 3)
/design       — Asset exports, color tokens (Team 4)
/docs         — Team assignment PDF + whitepaper summaries
FUTURE.md     — Deferred features (add here, don't build today)
```

## Not Building Today

- Coloring / activity packs (Phase 1.5)
- Quiz / teacher mode / B2B portal (Phase 2)
- Physical off-screen device (Phase 3)
- Real payment processing
- Offline download
- Grade-aligned curriculum mapping
