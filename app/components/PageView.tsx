import { View, Text, Image, StyleSheet, Dimensions } from 'react-native';
import { Page, Language } from '../types';
import { DaytimeColors, BedtimeColors, Typography } from '../constants/colors';

const { width } = Dimensions.get('window');

interface Props {
  page: Page;
  language: Language;
  bedtimeMode: boolean;
}

export function PageView({ page, language, bedtimeMode }: Props) {
  const colors = bedtimeMode ? BedtimeColors : DaytimeColors;

  const text =
    language === 'km' ? page.text_km :
    language === 'fr' ? page.text_fr :
    page.text_en;

  const isKhmer = language === 'km';

  return (
    <View style={[styles.container, { backgroundColor: colors.background }]}>
      <Image
        source={{ uri: page.illustration_url }}
        style={[styles.illustration, bedtimeMode && { opacity: 0.85 }]}
        resizeMode="cover"
      />
      <View style={[styles.textBox, { backgroundColor: colors.surface }]}>
        <Text style={[
          styles.text,
          { color: colors.text },
          isKhmer && { fontFamily: Typography.fontKhmer, lineHeight: 34 },
        ]}>
          {text}
        </Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1 },
  illustration: { width, height: width * 0.65 },
  textBox: {
    flex: 1,
    padding: 24,
    justifyContent: 'center',
  },
  text: {
    fontSize: Typography.sizeBody,
    lineHeight: 28,
    textAlign: 'center',
  },
});
