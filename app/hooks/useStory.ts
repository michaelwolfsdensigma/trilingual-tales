import { useState, useEffect } from 'react';
import { Story, Page } from '../types';
import { supabase } from '../lib/supabase';

export function useStory(id: string) {
  const [story, setStory] = useState<Story | null>(null);
  const [pages, setPages] = useState<Page[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    Promise.all([
      supabase.from('stories').select('*').eq('id', id).single(),
      supabase.from('pages').select('*').eq('story_id', id).order('page_number'),
    ]).then(([storyRes, pagesRes]) => {
      if (storyRes.data) setStory(storyRes.data as Story);
      if (pagesRes.data) setPages(pagesRes.data as Page[]);
      setLoading(false);
    });
  }, [id]);

  return { story, pages, loading };
}
