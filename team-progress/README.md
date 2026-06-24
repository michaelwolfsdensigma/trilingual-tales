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
| Team 1 — App | `DONE` | Merged to main — full app live | — |
| Team 2 — Content | `DONE` | Merged to main — seed SQL + 69 assets | — |
| Team 3 — Backend | `DONE` | Migration 003 confirmed live ✅ | — |
| Team 4 — Design | `DONE` | Merged to main — full design system | — |

**Statuses:** `NOT STARTED` · `IN PROGRESS` · `BLOCKED` · `READY FOR INTEGRATION` · `DONE`

---

## Coordinator Note — *updated by Arden*

**🟢 DEMO READY — all branches merged to main.**

All 4 team branches are fully merged. Zero commits ahead of main across any branch.

---

**What's live on main:**

- **App (Team 1):** Full Expo/React Native app — Nitean branding, Expo Router, story list + reader, audio playback (Expo AV), language picker (KM/EN/FR), bedtime mode, freemium gate UI, Supabase hooks wired and live
- **Content (Team 2):** 3 trilingual folk tales, 22 pages, 44 TTS audio files (EN + FR), 25 illustrations — all in Supabase Storage. Seed SQL run. Freemium: Stories 1+2 free, Story 3 (The Golden Snail) locked
- **Backend (Team 3):** Schema, RLS, auth, migration 003 live — locked stories appear with badge, pages gated. Freemium toggle: `is_premium` on `profiles` table in Supabase Studio
- **Design (Team 4):** Nitean palette, bedtime mode spec, icon/splash (all Expo sizes), HTML prototype at `design/prototype/index.html`, cover template, asset manifest

**Freemium unlock — now wired end-to-end (commit `a1790a2`).** The gate was previously a
client-side illusion disconnected from the RLS gate; the app now signs in anonymously,
reads the real `profiles.is_premium`, and the in-app **"Unlock Premium"** button flips the
profile row so the server-side `is_premium()` gate releases the premium pages. Reviewed,
typechecked, merged to main.

⚠️ **One open action before the demo (dashboard only, no code/SQL):**
Supabase → Authentication → enable **Anonymous Sign-ins**. Without it the app never gets
a session and the unlock button has nothing to flip. (Team 3 documented this; toggle not
yet confirmed flipped.)

**To run the demo:**
1. Double-click the **Nitean** desktop icon, **or** `./launch-nitean.sh` (writes `.env` with
   live Supabase creds on first run, then `npx expo start`).
2. Tap **The Golden Snail** (locked) → **Unlock Premium** → story opens. That's the freemium moment.
3. Note: unlock persists per anonymous user. To re-demo the locked state, reset that user's
   `is_premium` to `false` in Studio, or clear app storage for a fresh anon user.

**Post-demo backlog (not blockers):** enable Anonymous Sign-ins (above), KM audio (22 files,
native speaker session), Story 2 KM text native review, per-page unique illustrations, real
payment flow (replace the mock self-update unlock with a webhook-driven `is_premium`).
