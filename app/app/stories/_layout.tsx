import { Stack } from 'expo-router';
import { View, TouchableOpacity, Text, StyleSheet } from 'react-native';
import { useApp } from '../../context/AppContext';
import { LanguagePicker } from '../../components/LanguagePicker';
import { DaytimeColors, BedtimeColors } from '../../constants/colors';

export default function StoriesLayout() {
  const { bedtimeMode, setBedtimeMode } = useApp();
  const colors = bedtimeMode ? BedtimeColors : DaytimeColors;

  return (
    <Stack
      screenOptions={{
        headerStyle: { backgroundColor: colors.background },
        headerTintColor: colors.text,
        headerRight: () => (
          <View style={styles.headerRight}>
            <LanguagePicker />
            <TouchableOpacity
              onPress={() => setBedtimeMode(!bedtimeMode)}
              style={[styles.bedtimeBtn, { borderColor: colors.primary }]}
            >
              <Text style={{ color: colors.primary, fontSize: 18 }}>
                {bedtimeMode ? '☀️' : '🌙'}
              </Text>
            </TouchableOpacity>
          </View>
        ),
      }}
    />
  );
}

const styles = StyleSheet.create({
  headerRight: { flexDirection: 'row', alignItems: 'center', gap: 8, marginRight: 8 },
  bedtimeBtn: { borderWidth: 1.5, borderRadius: 8, padding: 4 },
});
