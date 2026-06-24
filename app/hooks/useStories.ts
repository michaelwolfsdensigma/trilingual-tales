import { useState, useEffect } from 'react';
import { Story } from '../types';
import { MOCK_STORIES } from '../lib/mockData';

// Switch to a real Supabase query at Task 9
export function useStories() {
  const [stories, setStories] = useState<Story[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setTimeout(() => {
      setStories(MOCK_STORIES);
      setLoading(false);
    }, 300);
  }, []);

  return { stories, loading };
}
