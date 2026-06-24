# Integration Contracts

The single source of truth for all shared interfaces.
When anything in this file changes, post an update in BLOCKERS.md so other teams know to re-read it.

---

## Supabase Credentials

**Status:** `PENDING — Team 3 to fill in`

```
SUPABASE_URL=
SUPABASE_ANON_KEY=
```

*Posted by:* Team 3  
*Posted at:* —

---

## Data Model (Agreed Schema)

**Status:** `RATIFIED — Team 1 built against this schema; TypeScript types match exactly`

```sql
-- Stories
create table stories (
  id uuid primary key default gen_random_uuid(),
  title_km text, title_en text, title_fr text,
  level text,           -- L1, L2, L3, L4, L5, L6
  dev_stage text,       -- '0-1', '1-2', '2-3', '3+'
  is_free boolean default false,
  cover_image_url text,
  created_at timestamptz default now()
);

-- Pages
create table pages (
  id uuid primary key default gen_random_uuid(),
  story_id uuid references stories(id),
  page_number int,
  text_km text, text_en text, text_fr text,
  illustration_url text,
  audio_url_km text, audio_url_en text, audio_url_fr text
);

-- User profiles (extends Supabase auth.users)
create table profiles (
  id uuid primary key references auth.users(id),
  preferred_language text default 'en',  -- 'km', 'en', 'fr'
  is_premium boolean default false
);
```

*Ratified by:* Team 1 (de facto — built and TypeScript-verified against this schema)  
*Ratified at:* ~T+0:45  
*Change log:* (append here if schema changes after ratification)

> **Team 3 note:** Run migrations exactly as written above. Team 1's `types/index.ts` maps directly to these column names — any rename will break the app.

---

## Audio File Contract

**Status:** `RATIFIED — Team 1 built audio hooks against this spec`

- Format: MP3, 64 kbps, mono
- Storage: Supabase Storage, bucket `audio`
- Naming: `{story_id}_{page_number:02d}_{lang}.mp3`
  - Example: `3f2a1c_03_km.mp3`
- URL pattern: `{SUPABASE_URL}/storage/v1/object/public/audio/{filename}`
- Playback: pre-load on story open; do not start on tap

*Ratified by:* —  
*Ratified at:* —

---

## Illustration File Contract

**Status:** `PENDING`

- Format: PNG, max 1200px wide
- Storage: Supabase Storage, bucket `illustrations`
- Naming: `{story_id}_{page_number:02d}.png`
- Cover images: `{story_id}_cover.png`

*Ratified by:* —  
*Ratified at:* —

---

## Subscription / Freemium Contract

**Status:** `PENDING`

- No real payment flow in this build
- `is_premium` field on `profiles` table controls access
- Free stories: `is_free = true` on the `stories` row (accessible to all, no auth required)
- Premium stories: require auth + `profiles.is_premium = true`
- Toggle via Supabase Studio during demo (no admin UI needed for Build'o'thon)

*Ratified by:* —  
*Ratified at:* —

---

## Color Tokens (from Team 4)

**Status:** `PENDING — Team 4 to fill in; Team 1 has live placeholders in app/constants/colors.ts`

Team 1 has shipped working placeholder tokens matching the intended palette:

```ts
// Daytime
background: '#FDF6E3', surface: '#FFFFFF', primary: '#C68B2A',
text: '#2C1A0E', textMuted: '#7A5C3A', border: '#E8D5B0'

// Bedtime
background: '#1A0F00', surface: '#2A1A00', overlay: 'rgba(180,100,0,0.35)',
primary: '#C68B2A', text: '#F5D49A', textMuted: '#A07840'
```

**Team 4:** Post your final token values below and Team 1 will update `constants/colors.ts`.  
If you are happy with the placeholders above, confirm them and mark this DONE.

```ts
// Team 4 final tokens — paste here:
```

*Posted by:* Team 4  
*Posted at:* —

---

## Working Name

**Status:** `PENDING — agree at T+0:00 kickoff`

Working name: *(TBD)*  
Tagline KM: *(TBD)*  
Tagline EN: *(TBD)*  
Tagline FR: *(TBD)*
