import React, { createContext, useContext, useEffect, useState } from 'react';
import { Language } from '../types';
import { supabase } from '../lib/supabase';

interface AppContextValue {
  language: Language;
  setLanguage: (lang: Language) => void;
  bedtimeMode: boolean;
  setBedtimeMode: (on: boolean) => void;
  isPremium: boolean;
  unlock: () => Promise<void>;
}

const AppContext = createContext<AppContextValue | null>(null);

export function AppProvider({ children }: { children: React.ReactNode }) {
  const [language, setLanguage] = useState<Language>('en');
  const [bedtimeMode, setBedtimeMode] = useState(false);
  const [isPremium, setIsPremium] = useState(false);

  // Read the real premium state from the signed-in user's profile row.
  useEffect(() => {
    (async () => {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) return;
      const { data } = await supabase
        .from('profiles')
        .select('is_premium')
        .eq('id', user.id)
        .single();
      if (data) setIsPremium(data.is_premium);
    })();
  }, []);

  // Mock subscription unlock: flip the profile row to premium. RLS lets a user
  // update their own row (see backend/migrations/002_rls.sql), which makes the
  // server-side is_premium() gate return true and release the premium pages.
  async function unlock() {
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) return;
    await supabase.from('profiles').update({ is_premium: true }).eq('id', user.id);
    setIsPremium(true);
  }

  return (
    <AppContext.Provider value={{
      language, setLanguage,
      bedtimeMode, setBedtimeMode,
      isPremium, unlock,
    }}>
      {children}
    </AppContext.Provider>
  );
}

export function useApp() {
  const ctx = useContext(AppContext);
  if (!ctx) throw new Error('useApp must be used inside AppProvider');
  return ctx;
}
