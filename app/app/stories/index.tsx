import { View, FlatList, ActivityIndicator, Text, StyleSheet } from 'react-native';
import { useState } from 'react';
import { useStories } from '../../hooks/useStories';
import { useApp } from '../../context/AppContext';
import { StoryCard } from '../../components/StoryCard';
import { StagePicker } from '../../components/StagePicker';
import { DevStage } from '../../types';
import { DaytimeColors, BedtimeColors } from '../../constants/colors';

export default function StoriesScreen() {
  const { stories, loading } = useStories();
  const { language, isPremium, bedtimeMode } = useApp();
  const [stage, setStage] = useState<DevStage | 'all'>('all');
  const colors = bedtimeMode ? BedtimeColors : DaytimeColors;

  const filtered = stage === 'all'
    ? stories
    : stories.filter(s => s.dev_stage === stage);

  if (loading) {
    return (
      <View style={[styles.center, { backgroundColor: colors.background }]}>
        <ActivityIndicator color={colors.primary} />
      </View>
    );
  }

  return (
    <View style={[styles.container, { backgroundColor: colors.background }]}>
      <StagePicker selected={stage} onChange={setStage} />
      <FlatList
        data={filtered}
        numColumns={2}
        keyExtractor={item => item.id}
        renderItem={({ item }) => (
          <StoryCard story={item} language={language} isPremium={isPremium} />
        )}
        contentContainerStyle={styles.grid}
        ListEmptyComponent={
          <Text style={[styles.empty, { color: colors.textMuted }]}>
            No stories for this age group yet.
          </Text>
        }
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, paddingHorizontal: 8 },
  center: { flex: 1, justifyContent: 'center', alignItems: 'center' },
  grid: { paddingBottom: 24 },
  empty: { textAlign: 'center', marginTop: 40, fontSize: 16 },
});
