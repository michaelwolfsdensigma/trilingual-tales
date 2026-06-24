import { View, Text, Image, TouchableOpacity, StyleSheet } from 'react-native';
import { useRouter } from 'expo-router';
import { Story, Language } from '../types';
import { DaytimeColors } from '../constants/colors';

interface Props {
  story: Story;
  language: Language;
  isPremium: boolean;
}

export function StoryCard({ story, language, isPremium }: Props) {
  const router = useRouter();
  const colors = DaytimeColors;
  const locked = !story.is_free && !isPremium;

  const title =
    language === 'km' ? story.title_km :
    language === 'fr' ? story.title_fr :
    story.title_en;

  function handlePress() {
    if (locked) {
      router.push(`/stories/${story.id}?locked=true`);
    } else {
      router.push(`/stories/${story.id}`);
    }
  }

  return (
    <TouchableOpacity style={styles.card} onPress={handlePress} activeOpacity={0.85}>
      <Image
        source={{ uri: story.cover_image_url }}
        style={styles.cover}
        resizeMode="cover"
      />
      {locked && (
        <View style={styles.lockedBadge}>
          <Text style={styles.lockedText}>🔒</Text>
        </View>
      )}
      <View style={[styles.titleBar, { backgroundColor: colors.surface }]}>
        <Text style={[styles.title, { color: colors.text }]} numberOfLines={2}>
          {title}
        </Text>
        <Text style={[styles.stage, { color: colors.textMuted }]}>
          {story.dev_stage} yr · {story.level}
        </Text>
      </View>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  card: {
    borderRadius: 12,
    overflow: 'hidden',
    margin: 8,
    width: 160,
    elevation: 3,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.12,
    shadowRadius: 4,
  },
  cover: { width: 160, height: 120 },
  lockedBadge: {
    position: 'absolute',
    top: 8,
    right: 8,
    backgroundColor: 'rgba(0,0,0,0.55)',
    borderRadius: 12,
    padding: 4,
  },
  lockedText: { fontSize: 16 },
  titleBar: { padding: 10 },
  title: { fontSize: 14, fontWeight: '700', marginBottom: 2 },
  stage: { fontSize: 11 },
});
