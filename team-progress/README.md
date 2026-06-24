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
| Team 1 — App | `READY FOR INTEGRATION` | Swap mock data for live Supabase queries | Team 3 creds ✅ live on `main` — pull & wire |
| Team 2 — Content | `NOT STARTED` | Story texts + translations can begin now | Team 3 buckets ✅ live — uploads unblocked |
| Team 3 — Backend | `DONE` | Backend live: schema, RLS, storage, auth | — |
| Team 4 — Design | `NOT STARTED` | Color tokens + working name — nothing blocks starting | — |

**Statuses:** `NOT STARTED` · `IN PROGRESS` · `BLOCKED` · `READY FOR INTEGRATION` · `DONE`

---

## Coordinator Note — *updated by Arden*

**Team 3: DONE.** Schema, RLS, auth, storage buckets — all live. Credentials in INTEGRATION.md. BLK-001 resolved. Team 3 is now in integration-support mode. One minor note: the deliverables table in `team-3-backend.md` still shows `PENDING` for all rows — Team 3 should do a quick pass to mark those `DONE` to keep the board accurate.

**Team 1: next action is integration.** Pull `main`, copy `backend/supabase-client.ts` into `app/lib/`, create `app/.env` with `EXPO_PUBLIC_SUPABASE_URL` and `EXPO_PUBLIC_SUPABASE_ANON_KEY` (values in INTEGRATION.md), then swap `app/hooks/useStories.ts` and `app/hooks/useStory.ts` to query Supabase instead of `mockData.ts`. Team 3 is on call for any RLS issues.

**Team 2: fully unblocked.** Buckets `audio` and `illustrations` are live and public. Write story texts and translations first (no network needed), then upload assets. Seed via Supabase SQL Editor (bypasses RLS, which is the right approach for seeding). Team 1's `mockData.ts` has 3 rough folk tales with real Khmer text — use those as a starting point or replace them. Real Supabase UUIDs will differ from the `mock-001` IDs so seed fresh rows.

**Team 4: nothing blocking you.** Working name and color tokens are the two highest-value outputs right now. Team 1's placeholder palette is live and wearable — confirm or replace it in INTEGRATION.md. BLK-002 stays open until color tokens and a name are posted.
