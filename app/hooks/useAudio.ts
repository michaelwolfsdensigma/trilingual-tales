import { useEffect, useRef } from 'react';
import { Audio } from 'expo-av';
import { Page, Language } from '../types';

// Royalty-free chime placeholder until Team 2 or Team 4 provides a final file
const CHIME_URL = 'https://assets.mixkit.co/active_storage/sfx/2869/2869-preview.mp3';

export function useAudio(pages: Page[], currentPageIndex: number, language: Language) {
  const soundRef = useRef<Audio.Sound | null>(null);
  const chimeRef = useRef<Audio.Sound | null>(null);

  useEffect(() => {
    Audio.setAudioModeAsync({
      allowsRecordingIOS: false,
      playsInSilentModeIOS: true,
      staysActiveInBackground: false,
    });
  }, []);

  // Pre-load chime once on mount
  useEffect(() => {
    Audio.Sound.createAsync({ uri: CHIME_URL }).then(({ sound }) => {
      chimeRef.current = sound;
    }).catch(() => {
      // Chime is optional — never crash for it
    });
    return () => { chimeRef.current?.unloadAsync(); };
  }, []);

  // Load and auto-play narration for the current page + language
  useEffect(() => {
    const page = pages[currentPageIndex];
    if (!page) return;

    const audioUrl =
      language === 'km' ? page.audio_url_km :
      language === 'fr' ? page.audio_url_fr :
      page.audio_url_en;

    soundRef.current?.unloadAsync();
    soundRef.current = null;

    if (!audioUrl) return;

    let active = true;
    Audio.Sound.createAsync(
      { uri: audioUrl },
      { shouldPlay: true },
    ).then(({ sound }) => {
      if (active) {
        soundRef.current = sound;
      } else {
        sound.unloadAsync();
      }
    }).catch(() => {});

    return () => { active = false; };
  }, [pages, currentPageIndex, language]);

  // Clean up on unmount
  useEffect(() => {
    return () => { soundRef.current?.unloadAsync(); };
  }, []);

  async function playChime() {
    try {
      await chimeRef.current?.replayAsync();
    } catch {
      // Silent fail — chime is never worth breaking navigation
    }
  }

  return { playChime };
}
