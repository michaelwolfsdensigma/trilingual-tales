# Team 2 — Content + Audio Pipeline

**Branch:** `team/2-content`  
**Stack:** Supabase Storage, Google TTS, ffmpeg, Canva

---

## Current Status

| Item | Status |
|------|--------|
| Overall | `DONE` |
| Folk tale selection (3 stories) | `DONE` |
| Khmer original texts | `DONE` |
| English translations | `DONE` |
| French translations | `DONE` |
| TTS audio generation — EN + FR (44 files) | `DONE` |
| Illustration generation (25 PNGs via Canva) | `DONE` |
| Asset upload to Supabase Storage | `DONE — 69 files, 0 errors` |
| Database seed SQL | `DONE — 3 stories, 22 pages live` |
| Freemium gate | `DONE — Stories 1+2 free, Story 3 locked` |
| Khmer audio (native speaker recording) | `PENDING — future session` |

---

## Deliverables for Other Teams

| Deliverable | Needed by | Due | Status |
|-------------|-----------|-----|--------|
| Confirmed audio file format + naming | Team 1 (playback) | T+0:00 kickoff | `DONE — MP3 64kbps mono, {story_id}_{page:02d}_{lang}.mp3` |
| Seed SQL with all story/page rows | Team 3 (migration) | T+1:30 | `DONE — content/seed_template.sql` |
| All audio files in Supabase Storage | Team 1 (integration) | T+3:00 | `DONE — bucket: audio` |
| All illustrations in Supabase Storage | Team 1 (integration) | T+3:00 | `DONE — bucket: illustrations` |
| Story cover dimensions agreed | Team 4 (template) | T+0:30 | `PENDING — Team 4 still to deliver cover template` |

---

## Needs from Other Teams

| Need | From | Status |
|------|------|--------|
| Supabase URL + anon key | Team 3 | `DONE` |
| Supabase Storage bucket names confirmed | Team 3 | `DONE — audio + illustrations` |
| Story cover template (PNG) | Team 4 | `WAITING` |

---

## Story Tracker

| Story ID | Title | Khmer Text | EN Trans | FR Trans | Audio EN | Audio FR | Audio KM | Illustrations | In DB |
|----------|-------|-----------|---------|---------|---------|---------|---------|--------------|-------|
| `11111111-…` | The Rabbit in the Moon | ✅ | ✅ | ✅ | ✅ 6 files | ✅ 6 files | ⏳ pending | ✅ 7 PNGs | ✅ |
| `22222222-…` | The Monkey and the Crocodile | ✅ ⚠️ AI | ✅ | ✅ | ✅ 8 files | ✅ 8 files | ⏳ pending | ✅ 9 PNGs | ✅ |
| `33333333-…` | The Golden Snail | ✅ | ✅ | ✅ | ✅ 8 files | ✅ 8 files | ⏳ pending | ✅ 9 PNGs | ✅ |

⚠️ Story 2 Khmer text is AI-generated — native speaker review required before KM audio is recorded.

---

## IP/Rights Log

All content must fall into one of these lanes:
- **A — Public domain** (traditional Khmer folk tales, out-of-copyright works)
- **B — Openly licensed** (CC or equivalent, source verified per title)
- **C — Original** (written for this project, rights owned)

| Story | Lane | Source / Notes |
|-------|------|---------------|
| The Rabbit in the Moon | A — Public domain | Traditional Khmer folk tale (Jataka tale origin) |
| The Monkey and the Crocodile | A — Public domain | Traditional Khmer/South-East Asian folk tale |
| The Golden Snail | A — Public domain | Traditional Khmer folk tale |

---

## Storage Manifest

**Bucket: `audio`** — 44 files uploaded ✅
- Naming: `{story_id}_{page:02d}_{lang}.mp3`
- Format: MP3, 64 kbps, mono
- Languages: EN + FR complete. KM pending native speaker recording session.

**Bucket: `illustrations`** — 25 files uploaded ✅
- Naming: `{story_id}_{page:02d}.png` and `{story_id}_cover.png`
- Format: PNG, 1200px wide
- Note: all page slots use story cover image; unique per-page illustrations are future work.

---

## Remaining Tasks

| Task | Owner | Status |
|------|-------|--------|
| Native speaker KM audio — 22 files (6+8+8 pages) | Team 2 / native speaker | Pending recording session |
| Upload KM audio to `audio` bucket once recorded | Team 2 | Pending above |
| Per-page illustrations (unique per page) | Team 2 / Team 4 | Future work |

---

## Progress Log

*(Append timestamped entries below as work proceeds. Do not edit previous entries.)*

---

### 2026-06-24 (+07) — Team 2 content COMPLETE ✅

- ✅ 3 trilingual folk tales written: The Rabbit in the Moon (6pp), The Monkey and the Crocodile (8pp), The Golden Snail (8pp). All text in KM/EN/FR.
- ✅ 44 TTS MP3s generated via Google TTS, re-encoded to 64 kbps mono with ffmpeg (EN + FR only).
- ✅ 25 illustrations generated via Canva (cover + all page slots per story, 1200px PNG).
- ✅ Story 002 Khmer text corrected — original had Golden Snail text copy-pasted into the Monkey column; rewritten by AI to follow the correct narrative. **Flagged for native speaker review before audio is recorded.**
- ✅ All 69 files uploaded to Supabase Storage — 44 MP3s to `audio` bucket, 25 PNGs to `illustrations` bucket. Zero errors.
- ✅ Seed SQL run in Supabase SQL Editor — 3 stories and 22 pages live in `public.stories` / `public.pages`. Freemium gate set: Stories 1+2 `is_free = true`, Story 3 `is_free = false`.
- ✅ Completed seed SQL committed to `team/2-content` branch at `content/seed_template.sql`.
- **BLK-003 RESOLVED.** Team 1 app now has real content.
- **Outstanding:** Khmer audio (22 files) requires a native speaker recording session. File naming and storage paths are already defined; upload to `audio` bucket when ready.

---

### 2026-06-24 15:15 (+07) — Coordinator close
- Branch `team/2-content` merged to main (seed conflict resolved in Team 2's favour — completed seed kept over Team 3's blank scaffold). 3 stories / 22 pages / 69 assets live.
- Open backlog (post-demo, not blockers): KM audio (22 files, native speaker session), Story 2 KM text native review, per-page unique illustrations.
