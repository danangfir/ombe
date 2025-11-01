# Cara Mengaktifkan Font Pepi

Font Pepi sementara dinonaktifkan agar aplikasi bisa berjalan tanpa error.

## ✅ Aplikasi Sekarang Bisa Dijalankan

Aplikasi sekarang menggunakan font default Flutter. Semua style dan UI tetap berfungsi normal.

## 📝 Cara Mengaktifkan Font Pepi

Setelah Anda memiliki file font Pepi, ikuti langkah berikut:

### 1. Tambahkan File Font ke Folder `fonts/`

Copy file-font berikut ke folder `fonts/`:
- `Pepi-SemiBold.ttf`
- `Pepi-Bold.ttf`
- `Pepi-Regular.ttf`

### 2. Uncomment Konfigurasi Font di `pubspec.yaml`

Buka file `pubspec.yaml`, cari bagian font (baris 71-81) dan uncomment:

**Ubah dari:**
```yaml
# Custom fonts configuration - Pepi
# UNCOMMENT SETELAH FILE FONT DITAMBAHKAN KE FOLDER fonts/
# fonts:
#   - family: Pepi
#     fonts:
#       - asset: fonts/Pepi-SemiBold.ttf
#         weight: 600
#       - asset: fonts/Pepi-Bold.ttf
#         weight: 700
#       - asset: fonts/Pepi-Regular.ttf
#         weight: 400
```

**Menjadi:**
```yaml
# Custom fonts configuration - Pepi
fonts:
  - family: Pepi
    fonts:
      - asset: fonts/Pepi-SemiBold.ttf
        weight: 600
      - asset: fonts/Pepi-Bold.ttf
        weight: 700
      - asset: fonts/Pepi-Regular.ttf
        weight: 400
```

### 3. Aktifkan Font di `text_styles.dart`

Buka file `lib/styles/text_styles.dart`, ubah baris 23:

**Ubah dari:**
```dart
static const String? fontFamily = null; // Set ke 'Pepi' setelah font ditambahkan
```

**Menjadi:**
```dart
static const String fontFamily = 'Pepi';
```

### 4. Aktifkan Font di `main.dart`

Buka file `lib/main.dart`, tambahkan `fontFamily: 'Pepi'` ke semua TextStyle di TextTheme.

Atau gunakan cara cepat dengan find & replace:
- Find: `TextStyle(fontSize:`
- Replace: `TextStyle(fontFamily: 'Pepi', fontSize:`

### 5. Jalankan Command

```bash
cd ombe
flutter pub get
flutter clean
flutter run
```

## 🎯 Setelah Font Diaktifkan

Semua teks di aplikasi akan otomatis menggunakan font **Pepi**:
- Heading → Pepi Bold/SemiBold
- Body text → Pepi Regular
- Button → Pepi SemiBold

## 📌 Catatan

- Font Pepi akan digunakan secara otomatis setelah diaktifkan
- Jika font tidak muncul, pastikan file font ada di folder `fonts/` dan nama file sesuai
- Jalankan `flutter clean` jika font tidak muncul setelah ditambahkan

