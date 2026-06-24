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
- 2026-06-24 (+07) — Migrations `001_schema.sql` + `002_rls.sql` **applied** to the live DB by Team 3. Tables `stories`, `pages`, `profiles` created; signup trigger + RLS active. No schema changes from the ratified model.

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

**✅ Bucket `audio` created and PUBLIC (Team 3, 2026-06-24). Ready for Team 2 uploads.**

*Ratified by:* Team 3 (bucket live)  
*Ratified at:* 2026-06-24 (+07)

---

## Illustration File Contract

**Status:** `LIVE — bucket created by Team 3`

- Format: PNG, max 1200px wide
- Storage: Supabase Storage, bucket `illustrations`
- Naming: `{story_id}_{page_number:02d}.png`
- Cover images: `{story_id}_cover.png`

**✅ Bucket `illustrations` created and PUBLIC (Team 3, 2026-06-24). Ready for Team 2 uploads.**

*Ratified by:* Team 3 (bucket live)  
*Ratified at:* 2026-06-24 (+07)

---

## Subscription / Freemium Contract

**Status:** `LIVE — enforced by RLS in the database`

- No real payment flow in this build
- `is_premium` field on `profiles` table controls access
- Free stories: `is_free = true` on the `stories` row (accessible to all, no auth required)
- Premium stories: require auth + `profiles.is_premium = true`
- Toggle via Supabase Studio during demo (no admin UI needed for Build'o'thon)
- **Enforcement (corrected in `003`):** the gate is on **pages (content)**, not on the stories listing.
  - **`stories`** — ALL rows listable by everyone (migration `003`), so locked stories appear in the
    grid with a lock badge (title + cover + `is_free`). They are no longer hidden.
  - **`pages`** — readable only if parent story `is_free = true` OR `public.is_premium()` (migration `002`).
    This is what actually locks the story content. Flip `profiles.is_premium` in Table Editor to unlock.
- **⚠️ Fix note (2026-06-24):** `002` originally gated the `stories` table, which made premium stories
  *invisible* to anon users (reported by Team 1/QA). `003_fix_stories_visibility.sql` corrects this.
  **Run `003` if you applied `002` before this note.**

*Ratified by:* Team 3 (RLS applied)  
*Ratified at:* 2026-06-24 (+07)

---

## Color Tokens (from Team 4)

**Status:** `LIVE — final tokens posted by Team 4 (design/color-tokens.ts)`

Full token file at `design/color-tokens.ts`. **Team 1:** copy into `app/constants/colors.ts`.

```ts
export const colorTokens = {
  day: {
    background: '#FFF8EA',
    surface: '#FFFFFF',
    surfaceAlt: '#F3E7D2',
    primary: '#B7791F',
    primaryPressed: '#8F5A13',
    secondary: '#275C65',
    accent: '#9E3F2F',
    text: '#26170F',
    textMuted: '#6F5944',
    border: '#E7D6B8',
    success: '#3F7D5B',
    locked: '#8A6F55',
  },
  bedtime: {
    background: '#100B08',
    surface: '#1D130D',
    surfaceAlt: '#2B1D12',
    overlay: 'rgba(44, 24, 10, 0.72)',
    scrim: 'rgba(0, 0, 0, 0.45)',
    primary: '#D6A24E',
    primaryPressed: '#B7791F',
    secondary: '#6FA5A0',
    accent: '#C86E4A',
    text: '#F6E4C7',
    textMuted: '#B99565',
    border: '#49331F',
    locked: '#8A6F55',
  },
} as const;
```

*Posted by:* Team 4  
*Posted at:* 2026-06-24 12:55 (+07)

---

## Working Name

**Status:** `LOCKED — Team 4 recommendation, posted 2026-06-24`

Working name: **Nitean**  
Tagline KM: **រឿងខ្មែរ បីភាសា សម្រាប់ពេលគេង**  
Tagline EN: **Khmer stories in three languages, made for bedtime.**  
Tagline FR: **Des histoires khmères en trois langues, pensées pour le coucher.**

**Naming note:** "Nitean" is Khmer-rooted, pronounceable in EN/FR contexts, and broad enough for a future audio device. "Trilingual Tales" remains the descriptive subtitle / value prop.

*Posted by:* Team 4  
*Posted at:* 2026-06-24 12:55 (+07)
