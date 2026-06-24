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
| Team 1 — App | `IN PROGRESS` | Apply Team 4 color tokens; real content live in app | — |
| Team 2 — Content | `DONE` | 3 stories, 22 pages, 69 files in Storage, seed SQL run | — |
| Team 3 — Backend | `DONE` | Integration support only | — |
| Team 4 — Design | `IN PROGRESS` | Bedtime spec + icon/splash + Figma prototype still pending | — |

**Statuses:** `NOT STARTED` · `IN PROGRESS` · `BLOCKED` · `READY FOR INTEGRATION` · `DONE`

---

## Coordinator Note — *updated by Arden*

**ALL BLOCKERS RESOLVED.** BLK-001, BLK-002, BLK-003 all closed. The app has a live backend, real content, and a name.

**Team 2: DONE — excellent work.** 3 trilingual folk tales, 22 pages, 44 TTS audio files (EN + FR), 25 illustrations — all in Supabase Storage. Seed SQL run, 3 stories live in the DB. IP log clean (all public domain). ⚠️ One outstanding flag: Story 2 Khmer text is AI-generated and needs native speaker review before KM audio is recorded. Khmer audio across all 3 stories (22 files) is the single remaining content gap — not a demo blocker but noted.

**Team 3: DONE.** Schema, RLS, auth, storage, seed template, integration support — everything delivered. Team 3 also took on coordination cleanup (resolving BLK-003, updating Team 2's progress file). Strong team contribution.

**Team 1: real content is in the app.** Supabase hooks are live. Remaining: pull `design/color-tokens.ts` and apply to `app/constants/colors.ts`; post Expo icon dimensions to `team-4-design.md`. Khmer font on a real device is still unverified — worth testing before demo if possible.

**Team 4: pending items are the demo polish gap.** Name and tokens are solid. Still outstanding and on the critical path: bedtime mode visual spec (Team 1 is waiting), app icon + splash (Team 1 has Expo placeholders), Figma prototype (demo backup). Cover template is now low-priority — Team 2 already generated covers without it.

**Demo readiness: ~75%.** The app works end-to-end with real content. What's missing is polish: final colors applied, icon/splash, bedtime mode spec, and Khmer audio.
