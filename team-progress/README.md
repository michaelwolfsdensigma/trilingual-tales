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
| Team 1 — App | `IN PROGRESS` | Integrating Team 4 icons/splash/bedtime spec | — |
| Team 2 — Content | `DONE` | 3 stories, 22 pages, 69 files in Storage, seed SQL run | — |
| Team 3 — Backend | `DONE` | ⚠️ Migration 003 in repo — must be run in SQL Editor before demo | — |
| Team 4 — Design | `DONE` | All deliverables posted — integration support only | — |

**Statuses:** `NOT STARTED` · `IN PROGRESS` · `BLOCKED` · `READY FOR INTEGRATION` · `DONE`

---

## Coordinator Note — *updated by Arden*

**Demo readiness: ~90%.** Four active blockers are all closed. The app is named Nitean, has live backend, real trilingual content, and final design assets. One critical database action and Team 1's final integration pass stand between now and demo-ready.

---

**⚠️ CRITICAL — Migration 003 must be run before the demo.**
`backend/migrations/003_fix_stories_visibility.sql` is in the repo but not yet applied to the live DB. Without it, locked/premium stories are completely invisible to non-premium users (no lock badge — they just don't appear). This breaks the freemium demo. Team 3 to paste into Supabase SQL Editor and run immediately.

---

**Team 1 — finishing the integration pass.** Two solid commits: Nitean palette applied to `app/constants/colors.ts`, and full Team 4 asset integration (icon, splash, Android variants, `app.json` renamed to "Nitean", bedtime image opacity applied). Branch not yet merged to main — merge when the final integration pass is complete. Progress file status table is stale but branch activity confirms they're moving.

**Team 2 — DONE.** Outstanding execution. 3 folk tales, 22 pages, 44 audio files, 25 illustrations. Known items for post-demo: KM audio (native speaker session needed for all 22 pages), Story 2 Khmer text native review, per-page unique illustrations.

**Team 3 — DONE** (pending migration 003 above). Strong coordination support throughout — self-caught and fixed a real freemium UX bug before it hit the demo.

**Team 4 — DONE.** Complete design system: color tokens, bedtime spec (detailed with motion, accessibility, copy), icon/splash in all Expo sizes, HTML prototype, cover template, asset manifest. Team 4 even raised and self-resolved BLK-004. Best coordination discipline of the build.
