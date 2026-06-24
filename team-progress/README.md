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
| Team 1 — App | `IN PROGRESS` | Apply Team 4 color tokens; await audio/illustrations from Team 2 | — |
| Team 2 — Content | `IN PROGRESS` | Upload TTS audio + illustrations to Supabase Storage | — |
| Team 3 — Backend | `DONE` | Integration support only | — |
| Team 4 — Design | `IN PROGRESS` | Cover template, bedtime spec, icon/splash still pending | — |

**Statuses:** `NOT STARTED` · `IN PROGRESS` · `BLOCKED` · `READY FOR INTEGRATION` · `DONE`

---

## Coordinator Note — *updated by Arden*

**Team 1: Supabase integration done.** `useStories` and `useStory` hooks now query the live DB. Next: pull Team 4's color tokens from `design/color-tokens.ts` and update `app/constants/colors.ts`. Also post Expo icon dimensions to `team-4-design.md` so Team 4 can finish the icon/splash. Progress file status table is stale — needs updating.

**Team 2: content SQL is complete and excellent.** 3 stories, 22 pages, full trilingual text. ⚠️ Story 2 Khmer text is AI-generated — flagged for native speaker review before audio recording. **Critical next step: upload the actual audio files and illustrations to Supabase Storage.** The seed SQL is wired to exact filenames — files must match those names or the app will show broken URLs. Run the seed SQL only after files are uploaded.

**Team 4: name and tokens delivered — good work.** "Nitean" is the right call. Color token file is clean and well-structured. Still outstanding: story cover template for Team 2, bedtime mode visual spec for Team 1, app icon + splash. These are on the critical path to a polished demo.

**Team 3:** Confirmed RLS allows anon reads on free stories — important integration support. Still needs deliverables table updated from PENDING to DONE in their progress file.

**BLK-002 resolved** — Team 4 has posted name and tokens. BLOCKERS.md updated below.
