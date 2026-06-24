-- =====================================================================
-- Trilingual Tales — SEED TEMPLATE  (for Team 2)
-- Prepared by Team 3 (Backend). Matches the live schema + contracts in
-- team-progress/INTEGRATION.md.
--
-- HOW TO USE
--   1. Copy a story block below, fill in the text in all 3 languages.
--   2. Keep each story's `id` fixed — the audio/illustration filenames are
--      built from it, so the DB rows and your uploaded files stay in sync.
--   3. Upload files to Storage with EXACTLY the names shown in the URLs
--      (bucket `audio` for .mp3, bucket `illustrations` for .png).
--   4. Paste the finished SQL into the Supabase SQL Editor and Run.
--      (SQL Editor bypasses RLS, so inserts work even though policies are on.)
--
-- CONTRACTS (see INTEGRATION.md)
--   Audio:        bucket `audio`         {story_id}_{page:02d}_{lang}.mp3   (MP3 64kbps mono)
--   Illustration: bucket `illustrations` {story_id}_{page:02d}.png          (PNG ≤1200px)
--   Cover:        bucket `illustrations` {story_id}_cover.png
--   Public URL:   https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/<bucket>/<file>
--   Freemium:     is_free = true  → open to everyone
--                 is_free = false → requires auth + profiles.is_premium = true
--   DEMO NEEDS:   at least 2 stories free, 1+ locked. Aim for 3 COMPLETE stories.
-- =====================================================================

-- Optional: remove the smoke-test rows from earlier backend verification.
delete from public.stories where title_en like 'TEST %';

-- =====================================================================
-- STORY 1  — FREE — fully worked example (copy this pattern)
-- Public-domain Khmer folk tale. Replace [KM]/[FR] placeholders with real
-- translations; English is filled in to show the structure.
-- =====================================================================
insert into public.stories (id, title_km, title_en, title_fr, level, dev_stage, is_free, cover_image_url)
values (
  '11111111-1111-1111-1111-111111111111',
  '[KM title]',                         -- e.g. ទន្សាយ​ឆ្លាត
  'The Clever Rabbit',
  '[FR title]',                         -- e.g. Le Lièvre Malin
  'L1', '0-1', true,
  'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/11111111-1111-1111-1111-111111111111_cover.png'
);

insert into public.pages
  (story_id, page_number, text_km, text_en, text_fr, illustration_url, audio_url_km, audio_url_en, audio_url_fr)
values
  ('11111111-1111-1111-1111-111111111111', 1,
   '[KM page 1]', 'Once, a little rabbit lived by the river.', '[FR page 1]',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/11111111-1111-1111-1111-111111111111_01.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_01_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_01_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_01_fr.mp3'),

  ('11111111-1111-1111-1111-111111111111', 2,
   '[KM page 2]', 'Every morning the rabbit greeted the rising sun.', '[FR page 2]',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/11111111-1111-1111-1111-111111111111_02.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_02_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_02_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_02_fr.mp3'),

  ('11111111-1111-1111-1111-111111111111', 3,
   '[KM page 3]', 'And the river sang the rabbit gently to sleep.', '[FR page 3]',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/11111111-1111-1111-1111-111111111111_03.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_03_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_03_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_03_fr.mp3');

-- =====================================================================
-- STORY 2  — FREE — skeleton (duplicate Story 1's pattern, add pages)
-- =====================================================================
insert into public.stories (id, title_km, title_en, title_fr, level, dev_stage, is_free, cover_image_url)
values (
  '22222222-2222-2222-2222-222222222222',
  '[KM title]', '[EN title]', '[FR title]',
  'L1', '1-2', true,
  'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/22222222-2222-2222-2222-222222222222_cover.png'
);

insert into public.pages
  (story_id, page_number, text_km, text_en, text_fr, illustration_url, audio_url_km, audio_url_en, audio_url_fr)
values
  ('22222222-2222-2222-2222-222222222222', 1,
   '[KM page 1]', '[EN page 1]', '[FR page 1]',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/22222222-2222-2222-2222-222222222222_01.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_01_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_01_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_01_fr.mp3');
  -- add page 2, 3, ... by copying the row above and bumping the page number

-- =====================================================================
-- STORY 3  — LOCKED (is_free = false) — this is the freemium demo story
-- =====================================================================
insert into public.stories (id, title_km, title_en, title_fr, level, dev_stage, is_free, cover_image_url)
values (
  '33333333-3333-3333-3333-333333333333',
  '[KM title]', '[EN title]', '[FR title]',
  'L2', '2-3', false,
  'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/33333333-3333-3333-3333-333333333333_cover.png'
);

insert into public.pages
  (story_id, page_number, text_km, text_en, text_fr, illustration_url, audio_url_km, audio_url_en, audio_url_fr)
values
  ('33333333-3333-3333-3333-333333333333', 1,
   '[KM page 1]', '[EN page 1]', '[FR page 1]',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/33333333-3333-3333-3333-333333333333_01.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_01_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_01_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_01_fr.mp3');

-- =====================================================================
-- VERIFY after running (should list your stories with page counts):
--   select s.title_en, s.is_free, count(p.*) as pages
--   from public.stories s left join public.pages p on p.story_id = s.id
--   group by s.id order by s.is_free desc;
-- =====================================================================
