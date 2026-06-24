# Team 3 — Backend + Auth

**Branch:** `team/3-backend`  
**Stack:** Supabase (Postgres + Auth + Storage + RLS)

---

## Current Status

| Item | Status |
|------|--------|
| Overall | `NOT STARTED` |
| Supabase project created | `PENDING` |
| Credentials posted to INTEGRATION.md | `PENDING` |
| Schema migrations run | `PENDING` |
| Storage buckets created (audio, illustrations) | `PENDING` |
| Row-level security policies | `PENDING` |
| Auth (email/password + Google) | `PENDING` |
| Profile trigger (auto-create on signup) | `PENDING` |
| is_premium toggle accessible in Studio | `PENDING` |
| supabase-client.ts export shared | `PENDING` |

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

---
