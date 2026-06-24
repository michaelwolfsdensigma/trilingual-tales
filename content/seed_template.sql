-- =====================================================================
-- Trilingual Tales — SEED DATA  (Team 2 — completed)
-- Run in: Supabase → SQL Editor → paste → Run
-- =====================================================================

-- Clean up any smoke-test rows from earlier backend verification.
delete from public.stories where title_en like 'TEST %';

-- =====================================================================
-- STORY 1 — The Rabbit in the Moon — FREE (is_free = true)
-- =====================================================================
insert into public.stories (id, title_km, title_en, title_fr, level, dev_stage, is_free, cover_image_url)
values (
  '11111111-1111-1111-1111-111111111111',
  'ទន្សាយ​នៅ​លើ​ព្រះ​ចន្ទ',
  'The Rabbit in the Moon',
  'Le Lapin dans la Lune',
  'L1', '0-1', true,
  'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/11111111-1111-1111-1111-111111111111_cover.png'
);

insert into public.pages
  (story_id, page_number, text_km, text_en, text_fr, illustration_url, audio_url_km, audio_url_en, audio_url_fr)
values
  ('11111111-1111-1111-1111-111111111111', 1,
   'ក្រសាន់តូចមួយរស់នៅក្នុងព្រៃ។ វាមានមិត្តភ័ក្តិច្រើន។',
   'A little rabbit lived in the forest. He had many friends.',
   'Un petit lapin vivait dans la forêt. Il avait beaucoup d''amis.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/11111111-1111-1111-1111-111111111111_01.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_01_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_01_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_01_fr.mp3'),

  ('11111111-1111-1111-1111-111111111111', 2,
   'មួយល្ងាច អ្នកដំណើរនឿយហត់ម្នាក់មកដល់ព្រៃ។ គាត់ឃ្លានខ្លាំងណាស់។',
   'One evening, a tired traveller came to the forest. He was very hungry.',
   'Un soir, un voyageur fatigué arriva dans la forêt. Il avait très faim.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/11111111-1111-1111-1111-111111111111_02.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_02_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_02_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_02_fr.mp3'),

  ('11111111-1111-1111-1111-111111111111', 3,
   'ស្វារកបានផ្លែឈើ។ ភ្លុករកបានត្រី។ ប៉ុន្តែក្រសាន់គ្មានអ្វីទាំងអស់។',
   'The monkey found fruit. The otter found fish. But the rabbit had nothing.',
   'Le singe trouva des fruits. La loutre trouva du poisson. Mais le lapin n''avait rien.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/11111111-1111-1111-1111-111111111111_03.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_03_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_03_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_03_fr.mp3'),

  ('11111111-1111-1111-1111-111111111111', 4,
   '«ខ្ញុំនឹងផ្តល់កំដៅនៃបេះដូងខ្ញុំ» ក្រសាន់និយាយ។',
   '"I will give the warmth of my heart," said the rabbit.',
   '« Je donnerai la chaleur de mon cœur », dit le lapin.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/11111111-1111-1111-1111-111111111111_04.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_04_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_04_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_04_fr.mp3'),

  ('11111111-1111-1111-1111-111111111111', 5,
   'ព្រះចន្ទមើលចុះហើយញញឹម។ ព្រះអង្គរំជួលចិត្តខ្លាំងណាស់។',
   'The moon god looked down and smiled. He was very moved.',
   'Le dieu de la lune regarda et sourit. Il était très touché.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/11111111-1111-1111-1111-111111111111_05.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_05_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_05_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_05_fr.mp3'),

  ('11111111-1111-1111-1111-111111111111', 6,
   'ព្រះអង្គគូររូបក្រសាន់នៅលើព្រះចន្ទ ដើម្បីឱ្យអ្នករាល់គ្នាអាចមើលឃើញចិត្តមេត្តារបស់វាជារៀងរហូត។ មើល — តើអ្នកអាចមើលឃើញវាទេ?',
   'He painted the rabbit in the moon, so everyone could see his kindness forever. Look — can you see him?',
   'Il dessina le lapin dans la lune, pour que tous voient sa bonté pour toujours. Regarde — tu le vois ?',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/11111111-1111-1111-1111-111111111111_06.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_06_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_06_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/11111111-1111-1111-1111-111111111111_06_fr.mp3');

-- =====================================================================
-- STORY 2 — The Monkey and the Crocodile — FREE (is_free = true)
-- NOTE: Khmer text was AI-generated. Have a native speaker review before
--       recording audio.
-- =====================================================================
insert into public.stories (id, title_km, title_en, title_fr, level, dev_stage, is_free, cover_image_url)
values (
  '22222222-2222-2222-2222-222222222222',
  'ស្វា​និង​នោច',
  'The Monkey and the Crocodile',
  'Le Singe et le Crocodile',
  'L1', '1-2', true,
  'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/22222222-2222-2222-2222-222222222222_cover.png'
);

insert into public.pages
  (story_id, page_number, text_km, text_en, text_fr, illustration_url, audio_url_km, audio_url_en, audio_url_fr)
values
  ('22222222-2222-2222-2222-222222222222', 1,
   'ស្វាឆ្លាតម្នាក់រស់នៅលើដើមឈើខ្ពស់ ជាប់នឹងស្ទឹង។',
   'A clever monkey lived in a tall tree by the river.',
   'Un singe malin vivait dans un grand arbre au bord de la rivière.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/22222222-2222-2222-2222-222222222222_01.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_01_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_01_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_01_fr.mp3'),

  ('22222222-2222-2222-2222-222222222222', 2,
   'រាល់ថ្ងៃ វាញ៉ាំផ្លែឈើមាសផ្អែម។',
   'Every day, he ate sweet golden fruit.',
   'Chaque jour, il mangeait de beaux fruits dorés et sucrés.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/22222222-2222-2222-2222-222222222222_02.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_02_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_02_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_02_fr.mp3'),

  ('22222222-2222-2222-2222-222222222222', 3,
   'នោចម្នាក់ហែលទឹកមកជិត។ «សូមចែករំលែកផ្លែឈើបន្តិច» វានិយាយ។',
   'A crocodile swam up. "Please, share your fruit," he said.',
   'Un crocodile s''approcha. « S''il te plaît, partage tes fruits », dit-il.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/22222222-2222-2222-2222-222222222222_03.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_03_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_03_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_03_fr.mp3'),

  ('22222222-2222-2222-2222-222222222222', 4,
   'រាល់ថ្ងៃ ស្វាបោះផ្លែឈើឱ្យនោច។ ពួកគេក្លាយជាមិត្តភ័ក្តិ។',
   'The monkey threw fruit to the crocodile every day. They became friends.',
   'Chaque jour, le singe lançait des fruits au crocodile. Ils devinrent amis.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/22222222-2222-2222-2222-222222222222_04.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_04_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_04_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_04_fr.mp3'),

  ('22222222-2222-2222-2222-222222222222', 5,
   'មួយថ្ងៃ នោចនិយាយថា «មករកផ្ទះខ្ញុំនៅក្រោមទឹកផង»។',
   'One day the crocodile said, "Come to my home under the water."',
   'Un jour, le crocodile dit : « Viens chez moi sous l''eau. »',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/22222222-2222-2222-2222-222222222222_05.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_05_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_05_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_05_fr.mp3'),

  ('22222222-2222-2222-2222-222222222222', 6,
   '«បេះដូងខ្ញុំនៅលើដើមឈើ!» ស្វាឆ្លាតនិយាយ។ «ខ្ញុំត្រូវទៅយកវាមុនសិន»។',
   '"My heart is in the tree!" said the clever monkey. "I must go and get it first."',
   '« Mon cœur est dans l''arbre ! » dit le singe malin. « Je dois aller le chercher d''abord. »',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/22222222-2222-2222-2222-222222222222_06.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_06_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_06_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_06_fr.mp3'),

  ('22222222-2222-2222-2222-222222222222', 7,
   'នោចហែលទឹកត្រឡប់ទៅ។ ស្វាលោតឡើងលើមែករបស់វា — រួចផុតហើយ!',
   'The crocodile swam back. The monkey jumped to his branch — safe and free!',
   'Le crocodile nagea jusqu''à l''arbre. Le singe sauta sur sa branche — sain et sauf !',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/22222222-2222-2222-2222-222222222222_07.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_07_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_07_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_07_fr.mp3'),

  ('22222222-2222-2222-2222-222222222222', 8,
   '«មិត្តពិតពុំបោកប្រាស់មិត្តភ័ក្តិទេ» ស្វានិយាយ។ ហើយវាពិតណាស់។',
   '"A true friend does not trick a friend," said the monkey. And he was right.',
   '« Un vrai ami ne trompe pas son ami », dit le singe. Et il avait raison.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/22222222-2222-2222-2222-222222222222_08.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_08_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_08_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/22222222-2222-2222-2222-222222222222_08_fr.mp3');

-- =====================================================================
-- STORY 3 — The Golden Snail — LOCKED (is_free = false, freemium demo)
-- =====================================================================
insert into public.stories (id, title_km, title_en, title_fr, level, dev_stage, is_free, cover_image_url)
values (
  '33333333-3333-3333-3333-333333333333',
  'ខ្យង​មាស',
  'The Golden Snail',
  'L''Escargot d''Or',
  'L2', '2-3', false,
  'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/33333333-3333-3333-3333-333333333333_cover.png'
);

insert into public.pages
  (story_id, page_number, text_km, text_en, text_fr, illustration_url, audio_url_km, audio_url_en, audio_url_fr)
values
  ('33333333-3333-3333-3333-333333333333', 1,
   'នៅក្នុងភូមិស្ងប់ស្ងាត់មួយ កសិករចិត្តល្អម្នាក់ធ្វើការនៅស្រែ។',
   'In a quiet village, a kind farmer worked in his rice field.',
   'Dans un village tranquille, un gentil fermier travaillait dans sa rizière.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/33333333-3333-3333-3333-333333333333_01.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_01_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_01_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_01_fr.mp3'),

  ('33333333-3333-3333-3333-333333333333', 2,
   'មួយព្រឹក គាត់រកបានខ្យងតូចមួយ ភ្លឺដូចមាស។',
   'One morning, he found a tiny snail, shining like gold.',
   'Un matin, il trouva un petit escargot brillant comme de l''or.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/33333333-3333-3333-3333-333333333333_02.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_02_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_02_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_02_fr.mp3'),

  ('33333333-3333-3333-3333-333333333333', 3,
   'គាត់យកវាទៅផ្ទះដោយស្រទន់ ហើយដាក់វាក្នុងពាងទឹក។',
   'He carried it home gently and placed it in a jar of water.',
   'Il le ramena chez lui doucement et le plaça dans un bocal d''eau.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/33333333-3333-3333-3333-333333333333_03.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_03_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_03_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_03_fr.mp3'),

  ('33333333-3333-3333-3333-333333333333', 4,
   'រាល់ព្រឹក ផ្ទះគាត់ស្អាត។ បាយកំពុងដាំ។ ប៉ុន្តែគ្មាននរណានៅទីនោះ។',
   'Every morning, his home was clean. Rice was cooking. But no one was there.',
   'Chaque matin, sa maison était propre. Le riz cuisait. Mais il n''y avait personne.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/33333333-3333-3333-3333-333333333333_04.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_04_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_04_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_04_fr.mp3'),

  ('33333333-3333-3333-3333-333333333333', 5,
   'គាត់លាក់ខ្លួនហើយមើល។ ក្មេងស្រីម្នាក់ចេញពីសំបកមាស ភ្លឺចាំង។',
   'He hid and watched. Out of the golden shell stepped a girl, glowing with light.',
   'Il se cacha et observa. De la coquille d''or sortit une fille, rayonnante de lumière.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/33333333-3333-3333-3333-333333333333_05.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_05_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_05_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_05_fr.mp3'),

  ('33333333-3333-3333-3333-333333333333', 6,
   'នាងជារាជបុត្រីមកពីមេឃ ដែលមកសម្រាកនៅទីនេះបន្តិច។',
   'She was a princess from the sky, resting here for a while.',
   'C''était une princesse du ciel, venue se reposer un moment.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/33333333-3333-3333-3333-333333333333_06.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_06_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_06_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_06_fr.mp3'),

  ('33333333-3333-3333-3333-333333333333', 7,
   '«សូមស្នាក់នៅ» កសិករនិយាយដោយស្រទន់។ នាងមើលទៅគាត់ហើយញញឹម។',
   '"Please stay," said the farmer kindly. She looked at him and smiled.',
   '« S''il te plaît, reste », dit le fermier avec douceur. Elle le regarda et sourit.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/33333333-3333-3333-3333-333333333333_07.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_07_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_07_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_07_fr.mp3'),

  ('33333333-3333-3333-3333-333333333333', 8,
   'សំបកមាសក្លាយជាផ្កាយនៅលើមេឃ។ នាងស្នាក់នៅ។ ពួកគេមិនដែលដាច់ស្រយាលគ្នាទៀតទេ។',
   'The golden shell became a star in the sky. She stayed. They were never lonely again.',
   'La coquille d''or devint une étoile dans le ciel. Elle resta. Ils ne furent plus jamais seuls.',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/illustrations/33333333-3333-3333-3333-333333333333_08.png',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_08_km.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_08_en.mp3',
   'https://hmhcyaxvcgepldafpeol.supabase.co/storage/v1/object/public/audio/33333333-3333-3333-3333-333333333333_08_fr.mp3');

-- =====================================================================
-- VERIFY (paste into SQL Editor after running above):
--   select s.title_en, s.is_free, count(p.*) as pages
--   from public.stories s left join public.pages p on p.story_id = s.id
--   group by s.id, s.title_en, s.is_free order by s.is_free desc;
-- Expected: Rabbit 6 pages (free), Monkey 8 pages (free), Golden Snail 8 pages (locked)
-- =====================================================================
