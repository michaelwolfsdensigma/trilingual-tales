# Team Progress — AI Coordination Layer

This folder is the shared coordination surface for all developer AIs during the Build'o'thon.
Read it at the start of any work block. Update it when something changes that another team needs to know.

---

## Protocol for AIs

### When to read
- At the start of every work session or after a break
- Before starting any task that touches a shared interface (schema, API, audio format, credentials)
- When you are blocked — check here first; the answer may already be posted

### When to write
- When your team completes a deliverable another team is waiting on
- When you discover a blocker that affects another team
- When you change something that was previously agreed (schema, file format, URL structure)
- At each integration checkpoint

### How to write
1. Open your team's file (`team-N-name.md`)
2. Append a timestamped entry in the format shown — do not rewrite existing entries
3. Update the **Status** and **Deliverables** tables at the top of your file
4. If you are blocked on another team, also add an entry to `BLOCKERS.md`
5. If you have resolved a cross-team blocker, mark it resolved in `BLOCKERS.md`
6. Commit and push immediately after writing — do not batch updates

### Commit convention
```
progress(team-N): <one line describing the update>
```
Example: `progress(team-3): Supabase credentials posted to INTEGRATION.md`

---

## Files in This Folder

| File | Purpose |
|------|---------|
| `README.md` | This file — protocol for AIs |
| `INTEGRATION.md` | Shared contracts: credentials, schema, API shapes, file formats |
| `BLOCKERS.md` | Active cross-team blockers and resolutions |
| `team-1-app.md` | Team 1 (App + Reader) progress log |
| `team-2-content.md` | Team 2 (Content + Audio) progress log |
| `team-3-backend.md` | Team 3 (Backend + Auth) progress log |
| `team-4-design.md` | Team 4 (Design + Brand) progress log |

---

## Quick Status (update this table when your team's status changes)

| Team | Status | Current Task | Blocked? |
|------|--------|-------------|---------|
| Team 1 — App | `IN PROGRESS` | Final branch merge to main — last step | — |
| Team 2 — Content | `DONE` | — | — |
| Team 3 — Backend | `DONE` | Migration 003 confirmed live ✅ | — |
| Team 4 — Design | `DONE` | — | — |

**Statuses:** `NOT STARTED` · `IN PROGRESS` · `BLOCKED` · `READY FOR INTEGRATION` · `DONE`

---

## Coordinator Note — *updated by Arden*

**Demo readiness: ~95%.** One step remaining — Team 1 merges their branch to main.

---

**Migration 003 ✅ LIVE** — confirmed by Team 3 at 14:40. All 3 stories now appear for anon users. The Golden Snail shows with a lock badge; its pages remain gated behind `is_premium`. Freemium demo flow is working correctly.

**Team 1 — one step from done.** Nitean palette applied, Team 4 icons/splash integrated, `app.json` renamed, bedtime image opacity set. Three commits on `team/1-app` not yet on main — merge to main is the final act.

**Team 2 — DONE.** 3 folk tales, 22 pages, 44 audio files (EN + FR), 25 illustrations. Post-demo backlog: KM audio (native speaker session), Story 2 Khmer text review, per-page unique illustrations.

**Team 3 — DONE.** Caught and fixed a real freemium UX bug (locked stories invisible) before it hit the demo. Strong coordination throughout.

**Team 4 — DONE.** Complete: tokens, bedtime spec, icon/splash, HTML prototype, cover template, asset manifest. Self-managed BLK-004. Best coordination discipline of the build.
