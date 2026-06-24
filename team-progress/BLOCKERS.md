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
- **Resolved at:** 2026-06-24 12:55 (+07)
- **Resolution:** Team 4 posted working name **Nitean**, KM/EN/FR tagline, and final day/bedtime color tokens to `INTEGRATION.md`. Token export added at `design/color-tokens.ts`. Team 1 can now update app color constants. Team 2 is still waiting on cover template dimensions, tracked in Team 4 deliverables rather than this blocker.

> **Team 4:** Nothing blocks you from starting. Working name and color tokens are the two most useful things right now.
