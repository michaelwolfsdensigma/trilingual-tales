import { View, TouchableOpacity, Text, StyleSheet } from 'react-native';
import { useApp } from '../context/AppContext';
import { Language } from '../types';
import { DaytimeColors, BedtimeColors } from '../constants/colors';

const LANGUAGES: { code: Language; label: string }[] = [
  { code: 'km', label: 'ខ្មែរ' },
  { code: 'en', label: 'EN' },
  { code: 'fr', label: 'FR' },
];

export function LanguagePicker() {
  const { language, setLanguage, bedtimeMode } = useApp();
  const colors = bedtimeMode ? BedtimeColors : DaytimeColors;

  return (
    <View style={[styles.row, { backgroundColor: colors.surface, borderColor: colors.border }]}>
      {LANGUAGES.map(({ code, label }) => (
        <TouchableOpacity
          key={code}
          style={[
            styles.tab,
            language === code && { backgroundColor: colors.primary },
          ]}
          onPress={() => setLanguage(code)}
          accessibilityRole="button"
          accessibilityLabel={`Switch to ${label}`}
        >
          <Text style={[
            styles.label,
            { color: language === code ? '#fff' : colors.text },
          ]}>
            {label}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
  );
}

const styles = StyleSheet.create({
  row: {
    flexDirection: 'row',
    borderRadius: 8,
    borderWidth: 1,
    overflow: 'hidden',
  },
  tab: {
    paddingHorizontal: 14,
    paddingVertical: 8,
  },
  label: {
    fontSize: 15,
    fontWeight: '600',
  },
});
