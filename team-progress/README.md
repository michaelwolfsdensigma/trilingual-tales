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
| Team 1 — App | `READY FOR INTEGRATION` | Waiting on Supabase creds to swap mock data | YES — needs Team 3 |
| Team 2 — Content | `NOT STARTED` | Story texts + translations can begin now | YES — needs Team 3 for uploads |
| Team 3 — Backend | `NOT STARTED` | **CRITICAL PATH — Supabase project needed now** | — |
| Team 4 — Design | `NOT STARTED` | Color tokens + working name — nothing blocks starting | — |

**Statuses:** `NOT STARTED` · `IN PROGRESS` · `BLOCKED` · `READY FOR INTEGRATION` · `DONE`

---

## Coordinator Note — *updated by Arden*

**Team 1 has shipped a complete app.** Full Expo scaffold, all screens, audio hooks, bedtime mode, freemium gate, TypeScript clean, verified on web. Running on mock data. Ready to connect to Supabase in ~5 minutes once Team 3 posts credentials.

**Team 3 is the critical path.** Every other team is blocked on or waiting for their Supabase project. This is the single highest-priority action right now.

**Team 2** can start writing story texts and translations immediately — uploads wait on Team 3 but content work does not. Team 1 has already roughed in 3 Khmer folk tales in `app/lib/mockData.ts` (Hare & Tortoise, Buffalo & Crow, Moon & Rabbit with Khmer/EN/FR text). Team 2 can build from these or replace them — note the mock IDs (`mock-001` etc.) will become real Supabase UUIDs once the database is live.

**Team 4** can start immediately — working name, color tokens, covers. Nothing blocks them. Team 1 has placeholder colors in `app/constants/colors.ts` matching the warm/bedtime palette; Team 4 just needs to post final tokens to INTEGRATION.md and Team 1 will update that file.
