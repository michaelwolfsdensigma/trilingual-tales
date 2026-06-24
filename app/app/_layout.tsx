import { Stack } from 'expo-router';
import { AppProvider } from '../context/AppContext';
import { useFonts, NotoSansKhmer_400Regular } from '@expo-google-fonts/noto-sans-khmer';
import * as SplashScreen from 'expo-splash-screen';
import { useEffect, useState } from 'react';
import { supabase } from '../lib/supabase';

SplashScreen.preventAutoHideAsync();

export default function RootLayout() {
  const [fontsLoaded] = useFonts({ NotoSansKhmer_400Regular });
  const [sessionReady, setSessionReady] = useState(false);

  // Ensure there is an auth session so RLS (profiles.is_premium / is_premium())
  // has a real auth.uid() to work with. Anonymous sign-in is enough for the
  // freemium demo — the handle_new_user trigger auto-creates the profile row.
  useEffect(() => {
    (async () => {
      const { data } = await supabase.auth.getSession();
      if (!data.session) {
        await supabase.auth.signInAnonymously();
      }
      setSessionReady(true);
    })();
  }, []);

  useEffect(() => {
    if (fontsLoaded && sessionReady) SplashScreen.hideAsync();
  }, [fontsLoaded, sessionReady]);

  if (!fontsLoaded || !sessionReady) return null;

  return (
    <AppProvider>
      <Stack screenOptions={{ headerShown: false }} />
    </AppProvider>
  );
}
