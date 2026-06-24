-- Trilingual Tales — RLS fix, migration 003
-- Team 3 (Backend). Run AFTER 002_rls.sql.
--
-- BUG: 002 gated the `stories` table itself, so locked (premium) stories were
-- INVISIBLE to anon/non-premium users — they vanished from the list instead of
-- appearing with a lock badge. The freemium gate belongs on the CONTENT (pages),
-- not on the story listing.
--
-- FIX: all stories are listable by everyone (title, cover, is_free → lets the app
-- show a lock badge). Access to the actual pages (text + audio) stays gated by the
-- existing `pages` policy from 002, which already requires is_free OR is_premium().

-- Replace the two restrictive stories policies with one open listing policy.
drop policy if exists "free stories readable by all"      on public.stories;
drop policy if exists "premium stories for premium users" on public.stories;

create policy "all stories listable"
  on public.stories for select
  using (true);

-- pages policy is unchanged and remains the gate:
--   "pages follow story access" → readable only if parent story is_free OR public.is_premium()
-- (no action needed here; documented for clarity)
