# Team 3 — Backend + Auth

**Branch:** `team/3-backend`  
**Stack:** Supabase (Postgres + Auth + Storage + RLS)

---

## Current Status

| Item | Status |
|------|--------|
| Overall | `DONE` |
| Supabase project created | `DONE` |
| Credentials posted to INTEGRATION.md | `DONE` |
| Schema migrations run | `DONE — 001 applied to live DB` |
| Storage buckets created (audio, illustrations) | `DONE — both public` |
| Row-level security policies | `DONE — 002 applied to live DB` |
| Auth (email/password + Google) | `DONE — Email enabled, confirm off; Google optional/skipped` |
| Profile trigger (auto-create on signup) | `DONE — trigger live (part of 001)` |
| is_premium toggle accessible in Studio | `DONE — flip in Table Editor → profiles` |
| supabase-client.ts export shared | `DONE — backend/supabase-client.ts` |

---

## Deliverables for Other Teams

| Deliverable | Needed by | Due | Status |
|-------------|-----------|-----|--------|
| Supabase URL + anon key | ALL TEAMS | T+0:15 | `PENDING` |
| Schema migrations applied | Team 2 (seed SQL) | T+0:30 | `PENDING` |
| `supabase-client.ts` export | Team 1 (app) | T+0:30 | `PENDING` |
| Storage bucket names confirmed | Team 2 (uploads) | T+0:30 | `PENDING` |
| is_premium toggle working in Studio | Demo prep | T+2:00 | `PENDING` |

---

## Needs from Other Teams

| Need | From | Status |
|------|------|--------|
| Seed SQL with story/page data | Team 2 | `WAITING` |
| Any schema change requests | Team 1 | `WAITING` |

---

## RLS Policies (to implement)

```sql
-- stories: free rows readable by anyone; premium rows require auth + is_premium
-- pages: follows parent story's is_free flag
-- profiles: user can only read/write their own row
```

---

## Progress Log

*(Append timestamped entries below as work proceeds. Do not edit previous entries.)*

### 2026-06-24 11:43 (+07)
- Supabase project created (ref `hmhcyaxvcgepldafpeol`).
- **Credentials posted to INTEGRATION.md** — `SUPABASE_URL` + anon key now LIVE. All teams unblocked on creds.
- Wrote migrations: `backend/migrations/001_schema.sql` (stories/pages/profiles + signup trigger) and
  `backend/migrations/002_rls.sql` (free-vs-premium RLS, profiles own-row).
- Wrote `backend/supabase-client.ts` for Team 1 (reads `EXPO_PUBLIC_SUPABASE_*` env vars).
- **Next:** run both migrations in the Supabase SQL Editor, create Storage buckets `audio` + `illustrations`,
  enable email/password + Google auth.

### 2026-06-24 — backend live
- ✅ Migrations `001_schema.sql` + `002_rls.sql` run in SQL Editor — no errors. Tables + trigger + RLS live.
- ✅ Storage buckets `audio` and `illustrations` created, both **public**. **Team 2: ready for uploads.**
- ✅ RLS enforced → freemium gate works at the DB. Demo unlock = flip `profiles.is_premium` in Table Editor.
- INTEGRATION.md: Audio / Illustration / Subscription contracts marked LIVE; schema change-log notes migrations applied.
- **Remaining for Team 3:** finish Auth — enable **Email** provider and turn **off** email confirmation
  (Authentication → Providers → Email) so demo signups are instant. Google login optional.
- **Hand-offs:** Team 1 → pull `main`, set `EXPO_PUBLIC_SUPABASE_URL` / `EXPO_PUBLIC_SUPABASE_ANON_KEY`.
  Team 2 → buckets live, seed via SQL Editor (bypasses RLS).

### 2026-06-24 — Team 3 backend COMPLETE ✅
- ✅ Auth: Email provider enabled, email confirmation OFF (instant demo signups). Google skipped (optional).
- Smoke test passed: free + locked story insert + RLS gate verified.
- **Team 3 status: DONE.** All deliverables shipped and on `main`. Now in integration-support mode —
  on call for Team 1 (client wiring) and Team 2 (seeding) until demo.
- ⚠️ Reminder: don't delete the RLS policies before the demo — they ARE the freemium gate.

---
