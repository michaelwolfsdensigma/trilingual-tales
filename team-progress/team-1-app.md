# Team 1 — Core App + Reader

**Branch:** `team/1-app`  
**Stack:** React Native + Expo SDK (iOS, Android, Web)

---

## Current Status

| Item | Status |
|------|--------|
| Overall | `DONE — merged to main; freemium unlock wired end-to-end` |
| Expo project scaffold | `DONE` |
| Khmer font (device test) | `PENDING — need Expo Go on real device` |
| Language picker | `DONE` |
| Story list screen | `DONE` |
| Story reader + page-turn | `DONE` |
| Audio playback (Expo AV) | `DONE` |
| Bedtime mode | `DONE` |
| Expo Web pass | `DONE — verified in Safari on localhost:8081` |
| Supabase integration | `DONE — real data from DB as of 2026-06-24 12:35 (+07)` |
| Freemium unlock (auth + RLS) | `DONE — anon sign-in + profile flip; needs dashboard toggle (see log)` |
| Branch merged to main | `DONE — team/1-app fully merged` |

---

## Deliverables for Other Teams

| Deliverable | Needed by | Status |
|-------------|-----------|--------|
| Confirm Khmer font renders on device | All teams (sanity) | `PENDING` |
| App connected to Supabase (real data) | Integration checkpoint T+2:30 | `PENDING` |
| Bedtime mode working end-to-end | Demo | `PENDING` |

---

## Needs from Other Teams

| Need | From | Status |
|------|------|--------|
| Supabase URL + anon key | Team 3 | `DONE` |
| Confirmed audio URL format | Team 2 | `DONE — spec in INTEGRATION.md` |
| Color tokens | Team 4 | `WAITING` |
| Story cover dimensions | Team 4 | `WAITING` |

---

## Progress Log

*(Append timestamped entries below as work proceeds. Do not edit previous entries.)*

---

**[~T+0:45] — Full app scaffold complete and verified on web**

Expo Router app live on `team/1-app`. All core screens built with mock data:
- Story list: cover grid, KM/EN/FR language picker, age-stage filter chips, lock badges
- Story reader: page-turn nav, trilingual text, illustration display, page counter
- Audio: Expo AV hook, narration pre-loads per page+language, page-turn chime
- Bedtime mode: amber overlay + parental PIN lock modal (4-digit)
- Freemium gate: locked story shows upgrade screen

Web build verified in Safari (localhost:8081). TypeScript passes clean.

**Waiting on:**
- Team 3: Supabase URL + anon key → will swap mock data hooks in ~5 min once received
- Team 3: Confirm RLS allows anon reads on `is_free = true` stories
- Team 4: Color tokens → will update `constants/colors.ts` when posted to INTEGRATION.md
- Real device with Expo Go to verify Khmer font rendering

**Ready to integrate at T+2:30 checkpoint** as soon as Team 3 posts credentials.

---

**[12:35 (+07)] — Supabase integration DONE**

Swapped mock-data hooks for live Supabase queries. `app/lib/supabase.ts` created; `useStories` and `useStory` now query the `stories` and `pages` tables directly. `.env` written with Team 3's credentials (gitignored). Committed and pushed on `team/1-app`.

Status: Team 1 core build is complete. The app reads real data from the database.

Needs:
- Team 2: audio files in Storage (`audio` bucket) — `useAudio.ts` will pick them up automatically from `audio_url_km/en/fr` fields once pages are seeded
- Team 4: color tokens to replace placeholders in `constants/colors.ts`
- Neither is blocking the demo flow — app works end-to-end with whatever data is in the DB

---

**[15:10 (+07)] — Freemium unlock wired end-to-end (coordinator-applied)**

Code review found the freemium gate was split across two disconnected layers: the
client tracked `isPremium` in local state that nothing ever set, while RLS gated
premium pages server-side behind `is_premium()`. The app never authenticated, so
the premium story's pages were unreachable and the unlock path was dead (the gate
screen only had a "Go Back" button).

Fix (commit `a1790a2`):
- `_layout.tsx`: anonymous sign-in on launch (trigger auto-creates the profile),
  render gated until the session exists so `auth.uid()` is real.
- `lib/supabase.ts`: AsyncStorage adapter + RN auth config for session persistence.
- `context/AppContext.tsx`: read real `is_premium` from the profile; `unlock()`
  flips the profile row (RLS `update own profile` already permits the self-update).
- `hooks/useStory.ts`: refetch on `isPremium` change so premium pages reload.
- `stories/[id].tsx`: real "Unlock Premium" button (spinner + clean re-entry).

`tsc --noEmit` passes clean. Branch merged to main.

⚠️ **One dashboard action remains (Team 3):** Supabase → Authentication → enable
**Anonymous Sign-ins**. Without it `signInAnonymously()` fails and the unlock has no
session to flip. Documented by Team 3 in `team-3-backend.md` (15:20 entry).

---
