import { useState, useEffect } from 'react';
import { Story, Page } from '../types';
import { supabase } from '../lib/supabase';

// `refetchKey` is a trigger: pass something that changes (e.g. isPremium) to
// re-run the query after the freemium gate opens, so premium pages reload.
export function useStory(id: string, refetchKey?: unknown) {
  const [story, setStory] = useState<Story | null>(null);
  const [pages, setPages] = useState<Page[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setLoading(true);
    Promise.all([
      supabase.from('stories').select('*').eq('id', id).single(),
      supabase.from('pages').select('*').eq('story_id', id).order('page_number'),
    ]).then(([storyRes, pagesRes]) => {
      if (storyRes.data) setStory(storyRes.data as Story);
      setPages((pagesRes.data as Page[]) ?? []);
      setLoading(false);
    });
  }, [id, refetchKey]);

  return { story, pages, loading };
}
