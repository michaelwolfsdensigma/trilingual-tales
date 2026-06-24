import React, { createContext, useContext, useState } from 'react';
import { Language } from '../types';

interface AppContextValue {
  language: Language;
  setLanguage: (lang: Language) => void;
  bedtimeMode: boolean;
  setBedtimeMode: (on: boolean) => void;
  isPremium: boolean;
  setIsPremium: (val: boolean) => void;
}

const AppContext = createContext<AppContextValue | null>(null);

export function AppProvider({ children }: { children: React.ReactNode }) {
  const [language, setLanguage] = useState<Language>('en');
  const [bedtimeMode, setBedtimeMode] = useState(false);
  const [isPremium, setIsPremium] = useState(false);

  return (
    <AppContext.Provider value={{
      language, setLanguage,
      bedtimeMode, setBedtimeMode,
      isPremium, setIsPremium,
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
