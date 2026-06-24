# Blockers

Active cross-team blockers. Add one when you are stuck waiting on another team.
Resolve it (don't delete it) when the blocker clears.

Format:
```
## [OPEN/RESOLVED] BLK-NNN — Short description
- **Raised by:** Team N
- **Blocking:** Team N (what task)
- **Waiting on:** Team N (what deliverable)
- **Raised at:** HH:MM
- **Resolved at:** HH:MM (fill in when resolved)
- **Resolution:** (what unblocked you)
```

---

## [RESOLVED] BLK-001 — Team 3 Supabase credentials not yet posted

- **Raised by:** Coordinator (Arden)
- **Blocking:** Team 1 — cannot swap mock data for real Supabase queries
- **Blocking:** Team 2 — cannot upload audio files or illustrations to Storage
- **Waiting on:** Team 3 — create Supabase project and post URL + anon key to INTEGRATION.md
- **Raised at:** post-kickoff audit
- **Resolved at:** 2026-06-24 11:43 (+07)
- **Resolution:** Supabase project live (ref `hmhcyaxvcgepldafpeol`). `SUPABASE_URL` + anon key posted to INTEGRATION.md (Supabase Credentials → `LIVE`). Schema + RLS migrations and `backend/supabase-client.ts` are in the repo. **Team 1:** pull `main`, set `EXPO_PUBLIC_SUPABASE_URL` / `EXPO_PUBLIC_SUPABASE_ANON_KEY` in `app/.env`. **Team 2:** Storage buckets `audio` + `illustrations` — see note below.

> **Team 3:** This is the #1 priority. Once credentials are posted, Teams 1 and 2 can unblock within minutes.
> **Update:** Credentials posted — see resolution above. ⚠️ Storage buckets are being created now; Team 2 confirm before bulk upload.

---

## [RESOLVED] BLK-002 — Team 4 color tokens and working name not yet posted

- **Raised by:** Coordinator (Arden)
- **Blocking:** Team 1 — placeholder colors in use; will update `constants/colors.ts` when final tokens arrive
- **Blocking:** Team 2 — story cover template dimensions not confirmed
- **Waiting on:** Team 4 — post final color tokens to INTEGRATION.md; confirm or replace Team 1's placeholders
- **Raised at:** post-kickoff audit
- **Resolved at:** 2026-06-24 (+07)
- **Resolution:** Team 4 posted final color tokens to `design/color-tokens.ts` and locked the working name **Nitean** with KM/EN/FR taglines. INTEGRATION.md updated with final tokens and name. Team 1 can now update `app/constants/colors.ts` from `design/color-tokens.ts`.

> **Team 4:** Nothing blocks you from starting. Working name and color tokens are the two most useful things right now.

---

## [OPEN] BLK-003 — Team 2 audio and illustration files not yet uploaded to Supabase Storage

- **Raised by:** Team 3 (integration support)
- **Blocking:** Team 2 — cannot run seed SQL until files are in Storage (all URLs will 404)
- **Blocking:** Team 1 — app has no real content to display until seed SQL is run
- **Waiting on:** Team 2 — run upload script against Supabase Storage buckets `audio` + `illustrations`
- **Raised at:** 2026-06-24 (+07)
- **Resolved at:** —
- **Resolution:** —

> **Team 2:** Upload script is ready (`upload_to_supabase.command`). Set `SUPABASE_SERVICE_ROLE_KEY` env var and run it. 44 MP3s → `audio` bucket, 25 PNGs → `illustrations` bucket. Then paste `content/seed_template.sql` into Supabase SQL Editor and run.
