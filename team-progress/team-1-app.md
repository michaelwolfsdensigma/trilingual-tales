# Team 1 — Core App + Reader

**Branch:** `team/1-app`  
**Stack:** React Native + Expo SDK (iOS, Android, Web)

---

## Current Status

| Item | Status |
|------|--------|
| Overall | `IN PROGRESS` |
| Expo project scaffold | `DONE` |
| Khmer font (device test) | `PENDING — need Expo Go on real device` |
| Language picker | `DONE` |
| Story list screen | `DONE` |
| Story reader + page-turn | `DONE` |
| Audio playback (Expo AV) | `DONE` |
| Bedtime mode | `DONE` |
| Expo Web pass | `DONE — verified in Safari on localhost:8081` |
| Supabase integration | `BLOCKED — waiting on Team 3 credentials` |

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
| Supabase URL + anon key | Team 3 | `WAITING` |
| Confirmed audio URL format | Team 2 | `WAITING` |
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
