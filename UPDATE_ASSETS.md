# Update Assets - SVG & PNG Integration

## ✅ Perubahan yang Telah Dilakukan

### 1. **Instalasi Package**
- Menambahkan `flutter_svg: ^2.0.9` di `pubspec.yaml`
- Package ini untuk support SVG images

### 2. **Logo Ombe** 
**File:** `lib/widgets/coffee_logo.dart`
- ✅ Menggunakan icon PNG: `assets/icons/icons8-coffee-50.png`
- ✅ Fallback ke custom paint jika image tidak ditemukan
- ✅ Ukuran responsive

### 3. **Ilustrasi Onboarding**
**File:** `lib/ui/onboarding_page.dart`
- ✅ Menggunakan SVG: `assets/images/onboard-image-coffee.svg`
- ✅ Menghapus custom painter lama
- ✅ Ukuran height: 320px
- ✅ Loading indicator saat SVG dimuat

### 4. **Helper Assets**
**File:** `lib/utils/asset_helper.dart`
- ✅ Update path logo ke `icons8-coffee-50.png`
- ✅ Menambahkan `onboardCoffee` untuk SVG onboarding
- ✅ Terorganisir: Icons, Images, dan SVG terpisah

---

## 📁 File Assets yang Digunakan

```
assets/
├── icons/
│   └── icons8-coffee-50.png    ✅ Logo Ombe
└── images/
    └── onboard-image-coffee.svg ✅ Ilustrasi Onboarding
```

---

## 🎯 Cara Menggunakan

### Logo Ombe (PNG)
```dart
// Di semua screen (login, signup, welcome)
const CoffeeLogo(size: 56)

// Atau manual
Image.asset(
  AppAssets.logo,
  width: 48,
  height: 48,
)
```

### Ilustrasi Onboarding (SVG)
```dart
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture.asset(
  AppAssets.onboardCoffee,
  height: 320,
  fit: BoxFit.contain,
)
```

---

## 📝 Catatan

### SVG vs PNG

**SVG (Onboarding):**
- ✅ Vector, tidak pecah di semua resolusi
- ✅ Ukuran file kecil
- ✅ Mudah di-customize warna
- ❌ Perlu package `flutter_svg`

**PNG (Logo):**
- ✅ Native support di Flutter
- ✅ Loading cepat
- ✅ Tidak perlu package tambahan
- ❌ Ukuran file bisa besar untuk resolusi tinggi

---

## 🔧 Troubleshooting

### SVG tidak muncul
1. Pastikan file ada di `assets/images/onboard-image-coffee.svg`
2. Pastikan sudah run `flutter pub get`
3. Restart app (hot restart tidak cukup untuk assets baru)

### PNG logo tidak muncul
1. Check file ada di `assets/icons/icons8-coffee-50.png`
2. Akan fallback ke custom paint jika tidak ditemukan
3. Check console untuk error messages

### Build error
```bash
# Clean dan rebuild
flutter clean
flutter pub get
flutter run
```

---

## 🎨 Mengganti Asset

### Ganti Logo
1. Replace file `assets/icons/icons8-coffee-50.png` dengan logo baru
2. Atau update path di `asset_helper.dart`
3. Restart app

### Ganti Ilustrasi Onboarding
1. Replace file `assets/images/onboard-image-coffee.svg` dengan SVG baru
2. Atau update path di `asset_helper.dart` dan `onboarding_page.dart`
3. Restart app

---

## 📚 Referensi

- [Flutter SVG Package](https://pub.dev/packages/flutter_svg)
- [Flutter Assets Documentation](https://docs.flutter.dev/development/ui/assets-and-images)
- [Best Practices for Images](https://docs.flutter.dev/development/ui/assets-and-images#resolution-aware-assets)

---

**Status:** ✅ Selesai dan berfungsi dengan baik!

