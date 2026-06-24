# Integration Contracts

The single source of truth for all shared interfaces.
When anything in this file changes, post an update in BLOCKERS.md so other teams know to re-read it.

---

## Supabase Credentials

**Status:** `LIVE — posted by Team 3`

```
SUPABASE_URL=https://hmhcyaxvcgepldafpeol.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhtaGN5YXh2Y2dlcGxkYWZwZW9sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODIyNTQzNDMsImV4cCI6MjA5NzgzMDM0M30.6xrcr1HKbmcVJZXJ_vhODIIlphskEliecZwnxmF6VqE
```

> The `anon` key is safe to commit — it is the public, RLS-gated client key.
> The database password and `service_role` key are secrets and are **never** committed here.

*Posted by:* Team 3  
*Posted at:* 2026-06-24 11:43 (+07)

---

## Data Model (Agreed Schema)

**Status:** `PENDING — ratify at T+0:00 kickoff`

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

*Ratified by:* —  
*Ratified at:* —  
*Change log:* (append here if schema changes after ratification)

---

## Audio File Contract

**Status:** `PENDING — ratify at T+0:00 kickoff`

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

**Status:** `PENDING — Team 4 to fill in by T+0:30`

```ts
// Paste Team 4's color token export here
export const colors = {
  // daytime
  // bedtime
  // typography
}
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
