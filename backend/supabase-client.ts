// Trilingual Tales — shared Supabase client (Team 3 → Team 1)
//
// Usage in the Expo app:
//   import { supabase } from '../backend/supabase-client'   // or copy into app/lib/
//
// Credentials come from env (EXPO_PUBLIC_* are exposed to the client bundle).
// Values are published in team-progress/INTEGRATION.md. Put them in app/.env:
//   EXPO_PUBLIC_SUPABASE_URL=https://hmhcyaxvcgepldafpeol.supabase.co
//   EXPO_PUBLIC_SUPABASE_ANON_KEY=eyJhbGci...

import { createClient } from '@supabase/supabase-js'

const SUPABASE_URL = process.env.EXPO_PUBLIC_SUPABASE_URL!
const SUPABASE_ANON_KEY = process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY!

export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
  auth: {
    persistSession: true,
    autoRefreshToken: true,
    detectSessionInUrl: false, // RN: no URL-based session detection
  },
})

// ---- Minimal typed shapes for the agreed schema (extend as needed) ----
export type Story = {
  id: string
  title_km: string | null
  title_en: string | null
  title_fr: string | null
  level: string | null
  dev_stage: string | null
  is_free: boolean
  cover_image_url: string | null
  created_at: string
}

export type Page = {
  id: string
  story_id: string
  page_number: number
  text_km: string | null
  text_en: string | null
  text_fr: string | null
  illustration_url: string | null
  audio_url_km: string | null
  audio_url_en: string | null
  audio_url_fr: string | null
}
