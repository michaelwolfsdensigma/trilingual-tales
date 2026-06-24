export type Language = 'km' | 'en' | 'fr';

export type DevStage = '0-1' | '1-2' | '2-3' | '3+';

export interface Story {
  id: string;
  title_km: string;
  title_en: string;
  title_fr: string;
  level: string;
  dev_stage: DevStage;
  is_free: boolean;
  cover_image_url: string;
  created_at: string;
}

export interface Page {
  id: string;
  story_id: string;
  page_number: number;
  text_km: string;
  text_en: string;
  text_fr: string;
  illustration_url: string;
  audio_url_km: string | null;
  audio_url_en: string | null;
  audio_url_fr: string | null;
}

export interface Profile {
  id: string;
  preferred_language: Language;
  is_premium: boolean;
}
