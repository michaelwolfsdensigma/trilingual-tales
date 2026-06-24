# Team 2 — Content + Audio Pipeline

**Branch:** `team/2-content`  
**Stack:** Supabase Storage, TTS (Google Cloud TTS or ElevenLabs), scripting

---

> **📌 Note from Team 3 (2026-06-24): you are unblocked.**
> - Supabase creds are **live** in `INTEGRATION.md`; Storage buckets **`audio`** and **`illustrations`** exist and are public.
> - A ready-to-fill seed file is waiting at **`content/seed_template.sql`** — fixed story IDs, all 3 languages, correct audio/illustration URL patterns, and 2-free + 1-locked already set up. Fill in the text, upload files with the matching names, paste into the SQL Editor, Run.
> - Inserts work via the **SQL Editor** even with RLS on (it bypasses policies). Upload filenames must match the URLs in the template exactly.

---

## Current Status

| Item | Status |
|------|--------|
| Overall | `NOT STARTED` |
| Folk tale selection (3–5 stories) | `PENDING` |
| Khmer original texts | `PENDING` |
| English translations | `PENDING` |
| French translations | `PENDING` |
| TTS audio generation (all 3 langs) | `PENDING` |
| Illustration sourcing / generation | `PENDING` |
| Asset upload to Supabase Storage | `BLOCKED — waiting on Team 3 credentials` |
| Database seed SQL | `PENDING` |
| Freemium gate (mark 2 stories free) | `PENDING` |

---

## Deliverables for Other Teams

| Deliverable | Needed by | Due | Status |
|-------------|-----------|-----|--------|
| Confirmed audio file format + naming | Team 1 (playback) | T+0:00 kickoff | `PENDING` |
| Seed SQL with all story/page rows | Team 3 (migration) | T+1:30 | `PENDING` |
| All audio files in Supabase Storage | Team 1 (integration) | T+3:00 | `PENDING` |
| Story cover dimensions agreed | Team 4 (template) | T+0:30 | `PENDING` |

---

## Needs from Other Teams

| Need | From | Status |
|------|------|--------|
| Supabase URL + anon key | Team 3 | `WAITING` |
| Supabase Storage bucket names confirmed | Team 3 | `WAITING` |
| Story cover template (PNG) | Team 4 | `WAITING` |

---

## Story Tracker

| Story ID | Title | Khmer Text | EN Trans | FR Trans | Audio KM | Audio EN | Audio FR | Illustrations | In DB |
|----------|-------|-----------|---------|---------|---------|---------|---------|--------------|-------|
| — | — | — | — | — | — | — | — | — | — |

---

## IP/Rights Log

All content must fall into one of these lanes:
- **A — Public domain** (traditional Khmer folk tales, out-of-copyright works)
- **B — Openly licensed** (CC or equivalent, source verified per title)
- **C — Original** (written for this project, rights owned)

| Story | Lane | Source / Notes |
|-------|------|---------------|
| — | — | — |

---

## Progress Log

*(Append timestamped entries below as work proceeds. Do not edit previous entries.)*

---
