# Agent Operating Protocol — Trilingual Tales Build'o'thon

> This file is the source of truth for how any AI agent works in this repo.
> `CLAUDE.md` is a symlink to it, so Claude Code and any AGENTS.md-aware tool read the same rules.

## At the start of every session

1. **Read `team-progress/README.md` first** — the coordination protocol.
2. **Then read your team file** — `team-progress/team-N-*.md` (you are one of teams 1–4).
3. **Then read `team-progress/INTEGRATION.md`** — the shared contracts everything depends on.

## While you work

- **Update your team file and commit with `progress(team-N): ...`** whenever something changes
  that another team needs to know (a contract filled in, a deliverable shipped, an interface
  changed, a dependency unblocked).
- Logs are **append-only**. Never rewrite or delete another team's entry — add a new dated entry
  under your own team's heading.
- If you are stuck on something another team owns, raise it in `team-progress/BLOCKERS.md`.
  When it clears, **resolve it in place — don't delete it** (keep the history).
- Shared contracts (Supabase creds, schema, audio naming, color tokens, working name) live **only**
  in `team-progress/INTEGRATION.md`. Don't fork them into your team file — link to them.

## Who owns what

| Team | Branch | Scope |
|------|--------|-------|
| Team 1 | `team/1-app` | Expo app shell, reader, audio, bedtime mode |
| Team 2 | `team/2-content` | Folk-tale texts, translations, audio files, seed data |
| Team 3 | `team/3-backend` | Supabase schema, RLS, auth, mock subscription |
| Team 4 | `team/4-design` | Assets, colour tokens, icon, Figma exports |

**Team 3 fills in the Supabase credentials in `INTEGRATION.md` first thing — everything gates on that.**

## Scope discipline

Today's scope is the demo script in `README.md` and nothing else. New ideas go in `FUTURE.md`,
not into today's build.
