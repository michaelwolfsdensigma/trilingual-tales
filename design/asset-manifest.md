# Team 4 Asset Manifest

Posted by Team 4 on 2026-06-24 14:19 (+07).

## Expo Assets

| Asset | Size | Destination |
|-------|------|-------------|
| App icon | 1024 x 1024 | `app/assets/icon.png` |
| Android adaptive foreground | 1024 x 1024 | `app/assets/android-icon-foreground.png` |
| Android adaptive background | 1024 x 1024 | `app/assets/android-icon-background.png` |
| Android monochrome icon | 1024 x 1024 | `app/assets/android-icon-monochrome.png` |
| Splash icon | 1024 x 1024 | `app/assets/splash-icon.png` |
| Web favicon | 48 x 48 | `app/assets/favicon.png` |

## Design Exports

| Asset | Size | Path |
|-------|------|------|
| App icon master | 1024 x 1024 | `design/exports/nitean-icon-1024.png` |
| Splash screen reference | 1242 x 2436 | `design/exports/nitean-splash-1242x2436.png` |
| Story cover template | 1200 x 900 | `design/exports/story-cover-template.png` |
| Prototype preview | Responsive HTML | `design/prototype/index.html` |

## App Config Guidance

When Team 1 integrates assets, keep the existing Expo paths and update display naming if desired:

```json
{
  "expo": {
    "name": "Nitean",
    "slug": "nitean",
    "icon": "./assets/icon.png",
    "android": {
      "adaptiveIcon": {
        "backgroundColor": "#100B08",
        "foregroundImage": "./assets/android-icon-foreground.png",
        "backgroundImage": "./assets/android-icon-background.png",
        "monochromeImage": "./assets/android-icon-monochrome.png"
      }
    },
    "web": {
      "favicon": "./assets/favicon.png"
    }
  }
}
```
