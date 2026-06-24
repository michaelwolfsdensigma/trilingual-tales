# Trilingual Tales — Build'o'thon Onboarding (shareable)

> Drop this in the team chat. One screen, everything an agent or a human needs to start.

## What we're building (one sentence)

A React Native / Expo children's story app delivering **Khmer, English and French** narrated tales
for the **0–3 developmental band** — built for diaspora parents who want a bedtime *ritual*, not just
another reading tool.

## The only thing that matters today: the demo script

A parent opens the app at 8pm → picks **French** → finds a Khmer folk tale at their child's stage →
taps play (French narration) → switches language **mid-story to Khmer** → toggles **bedtime mode**
(screen warms, animations calm) → tries a **locked** story → "subscribes" (admin toggle) → it unlocks.

That sequence, end to end, is the whole demo. **No** quiz, coloring, teacher dashboard or hardware.
Anything else goes in `FUTURE.md`, not into today's build.

## The four teams

| Team | Branch | Owns |
|------|--------|------|
| **1 — App** | `team/1-app` | Expo shell, language/level pickers, story reader, Expo AV audio, bedtime mode |
| **2 — Content** | `team/2-content` | 3–5 public-domain Khmer folk tales, KM/EN/FR text, TTS audio, illustrations, seed SQL |
| **3 — Backend** | `team/3-backend` | Supabase schema, RLS, auth, storage buckets, mock `is_premium` toggle, client export |
| **4 — Design** | `team/4-design` | Working name, colour tokens (day + bedtime), typography, icon/splash, Figma flow |

## Tell every team's AI this at the start of its session

> **Copy-paste, swapping `N` for your team number:**
>
> You are Team **N** on the Trilingual Tales Build'o'thon repo. Before doing anything:
> read `team-progress/README.md`, then your team file `team-progress/team-N-*.md`, then
> `team-progress/INTEGRATION.md`. As you work, append (never overwrite) dated entries to your team
> file and commit with `progress(team-N): ...` whenever something changes that another team needs to
> know. Raise blockers in `team-progress/BLOCKERS.md` and resolve them in place (don't delete). All
> shared contracts — Supabase creds, schema, audio naming, colour tokens, working name — live only in
> `INTEGRATION.md`. Today's scope is the demo script and nothing else; new ideas go to `FUTURE.md`.

(`AGENTS.md` / `CLAUDE.md` at the repo root say the same thing — agents that auto-read those get it for free.)

## How the coordination layer works (30 seconds)

- **`team-progress/INTEGRATION.md`** — the single source of shared contracts. Everything gates on it.
- **`team-progress/team-N-*.md`** — append-only logs. No agent ever rewrites another's entry → no conflicts.
- **`team-progress/BLOCKERS.md`** — raise when stuck on another team; resolve in place when it clears.
- Commit small and often as `progress(team-N): ...`; merge to `main` only at checkpoints.

## First 30 minutes — whole group, before splitting

1. **Ratify the data model** (`stories` / `pages` / `profiles` — already drafted in `INTEGRATION.md`).
2. **Team 3 creates the Supabase project and posts URL + anon key** to `INTEGRATION.md`. **Everything gates on this.**
3. **Team 2 confirms the 3 folk tales** + audio format (MP3, 64 kbps) and seeds placeholder rows.
4. **Agree a warm working name** ("Trilingual Tales" is a placeholder).
5. **Confirm Expo targets:** iOS, Android, Web — flag any platform-specific code.
6. **Team 1 verifies Khmer font renders on a real device** (emulators don't render Khmer reliably).

## Checkpoints

| Time | Milestone |
|------|-----------|
| T+0:00 | Data model locked · Supabase live · working name chosen |
| T+0:15 | Team 3 shares credentials |
| T+0:30 | Teams split |
| T+1:30 | Seed SQL delivered · Khmer font verified on device |
| T+2:30 | Team 1 on real Supabase data · RLS confirmed |
| T+3:00 | Final audio files uploaded |
| T+3:30 | Full integration: content + auth + bedtime mode end to end |
| T+4:00 | Final design assets · Figma prototype |
| T+4:30 | Demo prep + video backup |
| T+5:00 | **Demo** |

## Risks to watch

- **Khmer font** — test on real hardware in the first 30 min. Emulators lie.
- **Audio latency** — pre-load on story open; never start on tap. First-play delay kills the flow.
- **Scope creep** — the whitepaper has months of features. Today = the demo script, nothing else.
- **Content volume** — 3 *complete* stories beat 10 half-finished ones.
