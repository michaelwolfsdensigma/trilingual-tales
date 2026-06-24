import { View, Text, TouchableOpacity, StyleSheet, ActivityIndicator, Dimensions } from 'react-native';
import { useLocalSearchParams, useRouter, Stack } from 'expo-router';
import { useState } from 'react';
import { useStory } from '../../hooks/useStory';
import { useApp } from '../../context/AppContext';
import { useAudio } from '../../hooks/useAudio';
import { PageView } from '../../components/PageView';
import { BedtimeOverlay } from '../../components/BedtimeOverlay';
import { DaytimeColors, BedtimeColors } from '../../constants/colors';

export default function StoryReader() {
  const { id, locked } = useLocalSearchParams<{ id: string; locked?: string }>();
  const { language, bedtimeMode, isPremium } = useApp();
  const { story, pages, loading } = useStory(id);
  const [pageIndex, setPageIndex] = useState(0);
  const { playChime } = useAudio(pages, pageIndex, language);
  const router = useRouter();
  const colors = bedtimeMode ? BedtimeColors : DaytimeColors;

  if (loading) {
    return (
      <View style={[styles.center, { backgroundColor: colors.background }]}>
        <ActivityIndicator color={colors.primary} />
      </View>
    );
  }

  if (locked === 'true' || (!story?.is_free && !isPremium)) {
    return (
      <View style={[styles.center, { backgroundColor: colors.background }]}>
        <Stack.Screen options={{ title: 'Premium Story', headerShown: true }} />
        <Text style={styles.lockIcon}>🔒</Text>
        <Text style={[styles.gateTitle, { color: colors.text }]}>
          This story is for subscribers
        </Text>
        <Text style={[styles.gateBody, { color: colors.textMuted }]}>
          Ask a parent to unlock premium stories.
        </Text>
        <TouchableOpacity
          style={[styles.backBtn, { borderColor: colors.primary }]}
          onPress={() => router.back()}
        >
          <Text style={{ color: colors.primary, fontWeight: '700' }}>Go Back</Text>
        </TouchableOpacity>
      </View>
    );
  }

  if (!story || pages.length === 0) {
    return (
      <View style={[styles.center, { backgroundColor: colors.background }]}>
        <Text style={{ color: colors.text }}>Story not found.</Text>
      </View>
    );
  }

  const currentPage = pages[pageIndex];
  const isFirst = pageIndex === 0;
  const isLast = pageIndex === pages.length - 1;

  const title =
    language === 'km' ? story.title_km :
    language === 'fr' ? story.title_fr :
    story.title_en;

  return (
    <View style={[styles.container, { backgroundColor: colors.background }]}>
      <Stack.Screen options={{ title, headerShown: true }} />

      <PageView page={currentPage} language={language} bedtimeMode={bedtimeMode} />

      <View style={[styles.nav, { backgroundColor: colors.background }]}>
        <TouchableOpacity
          style={[styles.navBtn, { opacity: isFirst ? 0.3 : 1 }]}
          onPress={() => { if (!isFirst) { playChime(); setPageIndex(i => i - 1); } }}
          disabled={isFirst}
        >
          <Text style={[styles.navLabel, { color: colors.primary }]}>‹ Prev</Text>
        </TouchableOpacity>

        <Text style={[styles.pageIndicator, { color: colors.textMuted }]}>
          {pageIndex + 1} / {pages.length}
        </Text>

        <TouchableOpacity
          style={[styles.navBtn, { opacity: isLast ? 0.3 : 1 }]}
          onPress={() => { if (!isLast) { playChime(); setPageIndex(i => i + 1); } }}
          disabled={isLast}
        >
          <Text style={[styles.navLabel, { color: colors.primary }]}>Next ›</Text>
        </TouchableOpacity>
      </View>

      {bedtimeMode && <BedtimeOverlay />}
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1 },
  center: { flex: 1, justifyContent: 'center', alignItems: 'center', padding: 24 },
  nav: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: 24,
    paddingVertical: 16,
  },
  navBtn: { padding: 8 },
  navLabel: { fontSize: 18, fontWeight: '700' },
  pageIndicator: { fontSize: 14 },
  lockIcon: { fontSize: 56, marginBottom: 16 },
  gateTitle: { fontSize: 22, fontWeight: '700', marginBottom: 8, textAlign: 'center' },
  gateBody: { fontSize: 16, textAlign: 'center', marginBottom: 24 },
  backBtn: { borderWidth: 2, borderRadius: 10, paddingHorizontal: 24, paddingVertical: 12 },
});
