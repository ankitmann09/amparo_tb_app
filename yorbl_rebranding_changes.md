# Amparo App Rebranding Change Log

## Date: June 30, 2025

This document records all changes made to rebrand the app from "ThingsBoard PE App" to "Amparo".

---

### 1. App Name Changes
- Changed the Flutter project name in `pubspec.yaml` from `thingsboard_app` to `amparo_app`.
- Updated the app description in `pubspec.yaml` to "Flutter Amparo Mobile Application".
- Changed the Android app label in `android/app/src/main/AndroidManifest.xml` from `yorbl` to `amparo`.
- Changed the iOS app display name in `ios/Runner/Info-Debug.plist` and `ios/Runner/Info-Release.plist` from `ThingsBoard PE App` to `amparo` (key: `CFBundleName`).

### 2. Logo & Launcher Icon Changes
- Updated the `flutter_icons` configuration in `pubspec.yaml`:
  - Changed `image_path` from `assets/images/thingsboard.png` to the new Amparo logo (e.g., `assets/images/amparo.png`).
- Replaced all `launcher_icon.png` files in the following Android folders with the new Amparo logo:
  - `android/app/src/main/res/mipmap-hdpi/`
  - `android/app/src/main/res/mipmap-mdpi/`
  - `android/app/src/main/res/mipmap-xhdpi/`
  - `android/app/src/main/res/mipmap-xxhdpi/`
  - `android/app/src/main/res/mipmap-xxxhdpi/`
- Ran `flutter pub run flutter_launcher_icons:main` to regenerate launcher icons for Android and iOS.

### 3. Asset Management
- Added the new Amparo logo image to `assets/images/`.
- Updated asset references in `pubspec.yaml` if needed.

---

## Notes
- All references to "ThingsBoard" in the app name, description, and launcher icons have been replaced with "Amparo".
- If you add new features or assets in the future, update this document to keep a clear history of branding changes.

---

**End of Change Log**
