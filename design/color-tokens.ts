export const colorTokens = {
  day: {
    background: '#FFF8EA',
    surface: '#FFFFFF',
    surfaceAlt: '#F3E7D2',
    primary: '#B7791F',
    primaryPressed: '#8F5A13',
    secondary: '#275C65',
    accent: '#9E3F2F',
    text: '#26170F',
    textMuted: '#6F5944',
    border: '#E7D6B8',
    success: '#3F7D5B',
    locked: '#8A6F55',
  },
  bedtime: {
    background: '#100B08',
    surface: '#1D130D',
    surfaceAlt: '#2B1D12',
    overlay: 'rgba(44, 24, 10, 0.72)',
    scrim: 'rgba(0, 0, 0, 0.45)',
    primary: '#D6A24E',
    primaryPressed: '#B7791F',
    secondary: '#6FA5A0',
    accent: '#C86E4A',
    text: '#F6E4C7',
    textMuted: '#B99565',
    border: '#49331F',
    locked: '#8A6F55',
  },
} as const;

export type ColorMode = keyof typeof colorTokens;
export type ColorTokenName = keyof typeof colorTokens.day | keyof typeof colorTokens.bedtime;
