# Cara Menambahkan Icon dari Source Sendiri

Panduan lengkap untuk menambahkan dan menggunakan icon/image custom di aplikasi Flutter Ombe.

## 📁 Struktur Folder

```
ombe/
├── assets/
│   ├── icons/          # Folder untuk icon
│   │   ├── logo.png
│   │   ├── coffee_cup.png
│   │   └── ...
│   └── images/         # Folder untuk gambar
│       ├── welcome.png
│       └── ...
├── pubspec.yaml        # Konfigurasi assets
└── lib/
    └── ...
```

---

## 📝 Langkah-langkah

### **Step 1: Tambahkan File Icon ke Folder `assets/`**

1. Buat folder jika belum ada:
   ```
   assets/
   ├── icons/
   └── images/
   ```

2. Copy file icon Anda ke folder yang sesuai:
   - Icon kecil → `assets/icons/`
   - Gambar besar → `assets/images/`

**Format yang didukung:**
- PNG (disarankan untuk icon dengan transparansi)
- JPG/JPEG
- SVG (memerlukan package `flutter_svg`)
- GIF

---

### **Step 2: Konfigurasi di `pubspec.yaml`**

File `pubspec.yaml` sudah dikonfigurasi untuk membaca assets:

```yaml
flutter:
  assets:
    - assets/icons/
    - assets/images/
```

**Cara menambahkan asset spesifik:**

Jika ingin menambahkan file tertentu saja (bukan seluruh folder):
```yaml
flutter:
  assets:
    - assets/icons/logo.png
    - assets/icons/coffee_cup.png
    - assets/images/welcome.jpg
```

**Atau kombinasi:**
```yaml
flutter:
  assets:
    - assets/icons/          # Semua file di folder icons
    - assets/images/welcome.jpg  # File spesifik
```

---

### **Step 3: Jalankan `flutter pub get`**

Setelah menambahkan assets di `pubspec.yaml`:

```bash
cd ombe
flutter pub get
```

**⚠️ Penting:** Setiap kali menambahkan/mengubah assets di `pubspec.yaml`, jalankan `flutter pub get`.

---

### **Step 4: Gunakan Icon di Code**

Ada beberapa cara menggunakan icon/image di Flutter:

#### **Cara 1: Image.asset (Paling Umum)** ⭐

```dart
import 'package:flutter/material.dart';

// Icon sederhana
Image.asset(
  'assets/icons/logo.png',
  width: 48,
  height: 48,
)

// Dengan fit dan error handling
Image.asset(
  'assets/icons/coffee_cup.png',
  width: 100,
  height: 100,
  fit: BoxFit.contain,  // contain, cover, fill, dll
  errorBuilder: (context, error, stackTrace) {
    return Icon(Icons.error); // Fallback jika image tidak ditemukan
  },
)
```

#### **Cara 2: AssetImage (Untuk decoration)**

```dart
// Untuk background atau decoration
Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/welcome.jpg'),
      fit: BoxFit.cover,
    ),
  ),
)
```

#### **Cara 3: IconButton dengan Image**

```dart
IconButton(
  icon: Image.asset(
    'assets/icons/menu.png',
    width: 24,
    height: 24,
  ),
  onPressed: () {
    // Handle press
  },
)
```

---

## 💡 Contoh Praktis

### **1. Logo di AppBar**

```dart
AppBar(
  title: Image.asset(
    'assets/icons/logo.png',
    height: 32,
  ),
  centerTitle: true,
)
```

### **2. Icon di List Item**

```dart
ListTile(
  leading: Image.asset(
    'assets/icons/coffee.png',
    width: 40,
    height: 40,
  ),
  title: Text('Coffee Item'),
  subtitle: Text('Description'),
)
```

### **3. Background Image**

```dart
Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/background.jpg'),
      fit: BoxFit.cover,
    ),
  ),
  child: YourWidget(),
)
```

### **4. Responsive Image dengan Sizing**

```dart
LayoutBuilder(
  builder: (context, constraints) {
    return Image.asset(
      'assets/icons/logo.png',
      width: constraints.maxWidth * 0.5,  // 50% dari lebar
      height: constraints.maxWidth * 0.5,
      fit: BoxFit.contain,
    );
  },
)
```

### **5. Icon dengan Color Filter**

```dart
ColorFiltered(
  colorFilter: ColorFilter.mode(
    Colors.blue,  // Ubah warna icon
    BlendMode.srcIn,
  ),
  child: Image.asset(
    'assets/icons/icon.png',
    width: 24,
    height: 24,
  ),
)
```

---

## 🎯 Best Practices

### **1. Naming Convention**

Gunakan nama file yang jelas dan konsisten:
```
✅ assets/icons/home_icon.png
✅ assets/icons/user_profile.png
❌ assets/icons/icon1.png
❌ assets/icons/IMG_2024.png
```

### **2. Organisasi Folder**

Buat struktur folder yang terorganisir:
```
assets/
├── icons/
│   ├── navigation/      # Icon navigasi
│   ├── social/         # Icon social media
│   └── ui/             # Icon UI elements
└── images/
    ├── backgrounds/
    ├── illustrations/
    └── products/
```

Kemudian update `pubspec.yaml`:
```yaml
assets:
  - assets/icons/navigation/
  - assets/icons/social/
  - assets/icons/ui/
  - assets/images/backgrounds/
  - assets/images/illustrations/
```

### **3. Optimasi Ukuran**

- **Icon kecil:** 24x24, 32x32, 48x48 px (PNG)
- **Gambar besar:** Optimize dengan tools seperti TinyPNG
- **SVG:** Gunakan untuk icon yang perlu scaling tanpa loss quality

### **4. Multiple Resolution (Retina)**

Untuk dukungan multiple density, buat folder:
```
assets/
└── icons/
    ├── logo.png        # 1x (default)
    ├── 2.0x/
    │   └── logo.png    # 2x (retina)
    └── 3.0x/
        └── logo.png    # 3x (super retina)
```

Flutter akan otomatis memilih resolusi yang sesuai.

### **5. Error Handling**

Selalu siapkan fallback untuk icon yang tidak ditemukan:

```dart
Image.asset(
  'assets/icons/icon.png',
  errorBuilder: (context, error, stackTrace) {
    return Icon(Icons.error, color: Colors.grey);
  },
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return CircularProgressIndicator(
      value: loadingProgress.expectedTotalBytes != null
          ? loadingProgress.cumulativeBytesLoaded /
              loadingProgress.expectedTotalBytes!
          : null,
    );
  },
)
```

---

## 📦 Menggunakan SVG Icons

Jika ingin menggunakan SVG icon, install package terlebih dahulu:

### **1. Install Package**

```bash
flutter pub add flutter_svg
```

### **2. Update `pubspec.yaml`**

```yaml
dependencies:
  flutter_svg: ^2.0.0+1
```

### **3. Gunakan di Code**

```dart
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture.asset(
  'assets/icons/logo.svg',
  width: 48,
  height: 48,
  colorFilter: ColorFilter.mode(
    Colors.blue,
    BlendMode.srcIn,
  ),
)
```

---

## 🛠️ Troubleshooting

### **Icon tidak muncul**

1. ✅ Pastikan file ada di folder `assets/icons/`
2. ✅ Pastikan sudah ditambahkan di `pubspec.yaml`
3. ✅ Jalankan `flutter pub get`
4. ✅ Restart aplikasi (hot restart tidak cukup untuk assets baru)
5. ✅ Pastikan path benar (case-sensitive di Linux/Mac)

### **Error: Unable to load asset**

- Cek path di `pubspec.yaml` apakah sesuai dengan lokasi file
- Pastikan indentasi di YAML benar (spasi, bukan tab)
- Jalankan `flutter clean` lalu `flutter pub get`

### **Icon blur/pixelated**

- Gunakan resolusi yang lebih tinggi
- Atau gunakan SVG untuk icon
- Pastikan `fit: BoxFit.contain` jika perlu

---

## 📚 Contoh File Helper

Buat file helper untuk mengakses icon dengan mudah:

**`lib/utils/asset_helper.dart`:**

```dart
class AppAssets {
  // Private constructor
  AppAssets._();

  // Icons
  static const String logo = 'assets/icons/logo.png';
  static const String coffeeCup = 'assets/icons/coffee_cup.png';
  static const String user = 'assets/icons/user.png';
  
  // Images
  static const String welcome = 'assets/images/welcome.jpg';
  static const String background = 'assets/images/background.jpg';
}

// Penggunaan:
Image.asset(AppAssets.logo)
```

---

## ✅ Checklist

- [ ] File icon sudah ditambahkan ke folder `assets/icons/`
- [ ] Assets sudah dikonfigurasi di `pubspec.yaml`
- [ ] Sudah menjalankan `flutter pub get`
- [ ] Path icon benar dan case-sensitive
- [ ] Icon muncul dengan benar di aplikasi

---

**Selamat coding! 🎨**

