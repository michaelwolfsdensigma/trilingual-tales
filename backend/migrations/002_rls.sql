-- Trilingual Tales — RLS policies, migration 002
-- Team 3 (Backend). Run AFTER 001_schema.sql.
--
-- Access model (see team-progress/INTEGRATION.md → Subscription / Freemium Contract):
--   * Free stories  (is_free = true): readable by everyone, no auth required.
--   * Premium stories: readable only by authenticated users with profiles.is_premium = true.
--   * Profiles: a user can read/write only their own row.

alter table public.stories  enable row level security;
alter table public.pages    enable row level security;
alter table public.profiles enable row level security;

-- ---------------------------------------------------------------------------
-- Helper: is the current user premium?
-- ---------------------------------------------------------------------------
create or replace function public.is_premium()
returns boolean
language sql
stable
security definer set search_path = public
as $$
  select coalesce(
    (select p.is_premium from public.profiles p where p.id = auth.uid()),
    false
  );
$$;

-- ---------------------------------------------------------------------------
-- stories
-- ---------------------------------------------------------------------------
drop policy if exists "free stories readable by all"      on public.stories;
drop policy if exists "premium stories for premium users" on public.stories;

create policy "free stories readable by all"
  on public.stories for select
  using (is_free = true);

create policy "premium stories for premium users"
  on public.stories for select
  using (is_free = false and public.is_premium());

-- ---------------------------------------------------------------------------
-- pages (follow the parent story's access rule)
-- ---------------------------------------------------------------------------
drop policy if exists "pages follow story access" on public.pages;

create policy "pages follow story access"
  on public.pages for select
  using (
    exists (
      select 1 from public.stories s
      where s.id = pages.story_id
        and (s.is_free = true or public.is_premium())
    )
  );

-- ---------------------------------------------------------------------------
-- profiles (own row only)
-- ---------------------------------------------------------------------------
drop policy if exists "read own profile"   on public.profiles;
drop policy if exists "update own profile" on public.profiles;

create policy "read own profile"
  on public.profiles for select
  using (id = auth.uid());

create policy "update own profile"
  on public.profiles for update
  using (id = auth.uid())
  with check (id = auth.uid());

-- Note: is_premium is intentionally updatable by the user here for the Build'o'thon
-- mock-subscription demo (admin flips it in Studio, or the "subscribe" button flips it).
-- In production, is_premium would be locked down and set only by a payment webhook.
