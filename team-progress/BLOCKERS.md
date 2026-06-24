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
- **Resolution:** Team 4 posted working name **Nitean** + trilingual tagline to INTEGRATION.md. Final color tokens in `design/color-tokens.ts` — daytime + bedtime palettes, teal secondary, lacquer accent. Team 1 to pull and apply to `app/constants/colors.ts`. Story cover template still pending from Team 4 — not a blocker for Team 2 to write content, but needed before cover PNGs are generated.

---

## [OPEN] BLK-003 — Audio files and illustrations not yet uploaded to Supabase Storage

- **Raised by:** Coordinator (Arden)
- **Blocking:** Team 2 — cannot run seed SQL until files are in Storage (URLs will 404)
- **Blocking:** Team 1 — app will show broken audio/image URLs until files land
- **Waiting on:** Team 2 — generate TTS audio (27 files: 3 stories × ~3 langs × ~3 pages avg) and illustrations (covers + pages), upload to `audio` and `illustrations` buckets with exact filenames from `content/seed_template.sql`
- **Raised at:** post-Team-2-content audit
- **Resolved at:** —
- **Resolution:** —

> Filenames are locked to the IDs in the seed SQL. Do not rename files after uploading.
