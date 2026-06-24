import { ScrollView, TouchableOpacity, Text, StyleSheet } from 'react-native';
import { DevStage } from '../types';
import { DaytimeColors } from '../constants/colors';

const STAGES: { value: DevStage | 'all'; label: string }[] = [
  { value: 'all', label: 'All Ages' },
  { value: '0-1', label: '0–1 yr' },
  { value: '1-2', label: '1–2 yr' },
  { value: '2-3', label: '2–3 yr' },
  { value: '3+', label: '3+ yr' },
];

interface Props {
  selected: DevStage | 'all';
  onChange: (stage: DevStage | 'all') => void;
}

export function StagePicker({ selected, onChange }: Props) {
  const colors = DaytimeColors;

  return (
    <ScrollView horizontal showsHorizontalScrollIndicator={false} style={styles.scroll}>
      {STAGES.map(({ value, label }) => (
        <TouchableOpacity
          key={value}
          style={[
            styles.chip,
            { borderColor: colors.primary },
            selected === value && { backgroundColor: colors.primary },
          ]}
          onPress={() => onChange(value)}
        >
          <Text style={[
            styles.label,
            { color: selected === value ? '#fff' : colors.primary },
          ]}>
            {label}
          </Text>
        </TouchableOpacity>
      ))}
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  scroll: { paddingVertical: 8 },
  chip: {
    borderRadius: 20,
    borderWidth: 1.5,
    paddingHorizontal: 14,
    paddingVertical: 6,
    marginRight: 8,
  },
  label: { fontSize: 13, fontWeight: '600' },
});
