-- Trilingual Tales — schema migration 001
-- Team 3 (Backend). Matches the data model in team-progress/INTEGRATION.md.
-- Run in Supabase SQL Editor (Dashboard → SQL Editor → New query → paste → Run),
-- or via: psql "$SUPABASE_DB_URL" -f backend/migrations/001_schema.sql

-- ---------------------------------------------------------------------------
-- Tables
-- ---------------------------------------------------------------------------

-- Stories
create table if not exists public.stories (
  id              uuid primary key default gen_random_uuid(),
  title_km        text,
  title_en        text,
  title_fr        text,
  level           text,           -- L1, L2, L3, L4, L5, L6
  dev_stage       text,           -- '0-1', '1-2', '2-3', '3+'
  is_free         boolean not null default false,
  cover_image_url text,
  created_at      timestamptz not null default now()
);

-- Pages
create table if not exists public.pages (
  id               uuid primary key default gen_random_uuid(),
  story_id         uuid not null references public.stories(id) on delete cascade,
  page_number      int not null,
  text_km          text,
  text_en          text,
  text_fr          text,
  illustration_url text,
  audio_url_km     text,
  audio_url_en     text,
  audio_url_fr     text,
  unique (story_id, page_number)
);

create index if not exists pages_story_id_idx on public.pages (story_id);

-- User profiles (extends Supabase auth.users)
create table if not exists public.profiles (
  id                 uuid primary key references auth.users(id) on delete cascade,
  preferred_language text not null default 'en',  -- 'km' | 'en' | 'fr'
  is_premium         boolean not null default false
);

-- ---------------------------------------------------------------------------
-- Auto-create a profile row on signup
-- ---------------------------------------------------------------------------

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.profiles (id)
  values (new.id)
  on conflict (id) do nothing;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();
