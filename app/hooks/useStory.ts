import { useState, useEffect } from 'react';
import { Story, Page } from '../types';
import { MOCK_STORIES, MOCK_PAGES } from '../lib/mockData';

export function useStory(id: string) {
  const [story, setStory] = useState<Story | null>(null);
  const [pages, setPages] = useState<Page[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setTimeout(() => {
      const found = MOCK_STORIES.find(s => s.id === id) ?? null;
      const foundPages = MOCK_PAGES[id] ?? [];
      setStory(found);
      setPages(foundPages.sort((a, b) => a.page_number - b.page_number));
      setLoading(false);
    }, 200);
  }, [id]);

  return { story, pages, loading };
}
