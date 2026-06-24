import { View, Text, TouchableOpacity, StyleSheet, Modal } from 'react-native';
import { useState } from 'react';
import { useApp } from '../context/AppContext';
import { BedtimeColors } from '../constants/colors';

export function BedtimeOverlay() {
  const { setBedtimeMode } = useApp();
  const [showLock, setShowLock] = useState(false);
  const [pin, setPin] = useState('');

  function handleUnlock() {
    if (pin.length >= 4) {
      setBedtimeMode(false);
      setShowLock(false);
      setPin('');
    }
  }

  return (
    <>
      {/* Amber tint — pointerEvents none so taps pass through to reader controls */}
      <View
        style={[styles.tint, { backgroundColor: BedtimeColors.overlay }]}
        pointerEvents="none"
      />

      {/* Parental lock button sits above the tint */}
      <View style={styles.lockBtn} pointerEvents="box-none">
        <TouchableOpacity onPress={() => setShowLock(true)} style={styles.lockTouch}>
          <Text style={styles.lockIcon}>🔐</Text>
        </TouchableOpacity>
      </View>

      <Modal visible={showLock} transparent animationType="fade">
        <View style={styles.modalBg}>
          <View style={[styles.modalCard, { backgroundColor: BedtimeColors.surface }]}>
            <Text style={[styles.modalTitle, { color: BedtimeColors.text }]}>
              Exit Bedtime Mode?
            </Text>
            <Text style={[styles.modalBody, { color: BedtimeColors.textMuted }]}>
              Enter any 4 digits to exit.
            </Text>
            <View style={styles.pinRow}>
              {[1, 2, 3, 4, 5, 6, 7, 8, 9, 0].map(n => (
                <TouchableOpacity
                  key={n}
                  style={[styles.pinKey, { borderColor: BedtimeColors.primary }]}
                  onPress={() => setPin(p => p.length < 4 ? p + n : p)}
                >
                  <Text style={[styles.pinLabel, { color: BedtimeColors.text }]}>{n}</Text>
                </TouchableOpacity>
              ))}
            </View>
            <Text style={{ color: BedtimeColors.textMuted, marginBottom: 12 }}>
              {'●'.repeat(pin.length)}{'○'.repeat(4 - pin.length)}
            </Text>
            <TouchableOpacity
              style={[styles.confirmBtn, { backgroundColor: BedtimeColors.primary }]}
              onPress={handleUnlock}
            >
              <Text style={{ color: '#fff', fontWeight: '700' }}>Confirm</Text>
            </TouchableOpacity>
            <TouchableOpacity onPress={() => { setShowLock(false); setPin(''); }}>
              <Text style={[styles.cancel, { color: BedtimeColors.textMuted }]}>Cancel</Text>
            </TouchableOpacity>
          </View>
        </View>
      </Modal>
    </>
  );
}

const styles = StyleSheet.create({
  tint: { ...StyleSheet.absoluteFill, zIndex: 1 },
  lockBtn: { position: 'absolute', top: 16, right: 16, zIndex: 2 },
  lockTouch: { padding: 8, backgroundColor: 'rgba(0,0,0,0.4)', borderRadius: 8 },
  lockIcon: { fontSize: 22 },
  modalBg: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.7)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  modalCard: { borderRadius: 16, padding: 24, width: 300, alignItems: 'center' },
  modalTitle: { fontSize: 20, fontWeight: '700', marginBottom: 8 },
  modalBody: { fontSize: 14, marginBottom: 20, textAlign: 'center' },
  pinRow: { flexDirection: 'row', flexWrap: 'wrap', justifyContent: 'center', gap: 10, marginBottom: 16 },
  pinKey: { width: 52, height: 52, borderRadius: 26, borderWidth: 2, justifyContent: 'center', alignItems: 'center' },
  pinLabel: { fontSize: 20, fontWeight: '600' },
  confirmBtn: { borderRadius: 10, paddingHorizontal: 32, paddingVertical: 12, marginBottom: 12 },
  cancel: { fontSize: 14 },
});
