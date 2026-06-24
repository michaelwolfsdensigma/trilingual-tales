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
- **Resolved at:** 2026-06-24 ~12:55 (+07)
- **Resolution:** Team 4 posted working name **Nitean** + trilingual tagline to INTEGRATION.md. Final color tokens in `design/color-tokens.ts` — daytime + bedtime palettes, teal secondary, lacquer accent. Team 1 to pull and apply to `app/constants/colors.ts`.

---

## [RESOLVED] BLK-003 — Audio files and illustrations not yet uploaded to Supabase Storage

- **Raised by:** Coordinator (Arden) / Team 3 (integration support)
- **Blocking:** Team 2 — cannot run seed SQL until files are in Storage (URLs will 404)
- **Blocking:** Team 1 — app has no real content to display until seed SQL is run
- **Waiting on:** Team 2 — upload audio + illustrations to Storage buckets, run seed SQL
- **Raised at:** post-Team-2-content audit
- **Resolved at:** 2026-06-24 14:08 (+07)
- **Resolution:** All 69 files uploaded successfully — 44 MP3s to `audio` bucket, 25 PNGs to `illustrations` bucket. Seed SQL run in Supabase SQL Editor — 3 stories and 22 pages now live in the database. Team 1 app has real content to display. KM audio pending native speaker session (not a blocker for demo).
