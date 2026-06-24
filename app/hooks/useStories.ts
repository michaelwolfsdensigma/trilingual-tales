import { useState, useEffect } from 'react';
import { Story } from '../types';
import { supabase } from '../lib/supabase';

export function useStories() {
  const [stories, setStories] = useState<Story[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    supabase
      .from('stories')
      .select('*')
      .order('created_at', { ascending: true })
      .then(({ data, error }) => {
        if (!error && data) setStories(data as Story[]);
        setLoading(false);
      });
  }, []);

  return { stories, loading };
}
