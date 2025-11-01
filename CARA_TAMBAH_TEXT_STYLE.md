# Cara Menambahkan Style Teks Baru di Flutter

Dokumentasi ini menjelaskan berbagai cara menambahkan dan menggunakan style teks di aplikasi Ombe.

## 📁 Struktur File

```
lib/
├── styles/
│   ├── text_styles.dart      # Kumpulan semua text style
│   └── text_extensions.dart  # Extension untuk akses mudah via context
├── examples/
│   └── text_style_examples.dart  # Contoh penggunaan
└── main.dart                 # TextTheme sudah dikonfigurasi
```

---

## 🎯 5 Cara Menambahkan Style Teks

### **Cara 1: Menggunakan OmbeTextStyles langsung** ⭐ (Recommended)

Paling mudah dan cepat untuk penggunaan langsung.

```dart
import 'package:ombe/styles/text_styles.dart';

Text('Heading', style: OmbeTextStyles.headingLarge)
Text('Body text', style: OmbeTextStyles.bodyMedium)
Text('Subtitle', style: OmbeTextStyles.subtitleMedium)
```

**Keuntungan:**
- ✅ Langsung bisa digunakan
- ✅ Type-safe (IDE akan autocomplete)
- ✅ Konsisten di seluruh aplikasi

---

### **Cara 2: Menambahkan ke OmbeTextStyles**

Tambahkan style baru di file `lib/styles/text_styles.dart`:

```dart
class OmbeTextStyles {
  // ... existing styles ...

  /// Style baru untuk special text
  static const TextStyle specialText = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: primaryGreen,
    letterSpacing: 1.2,
  );
}
```

Kemudian gunakan:
```dart
Text('Special', style: OmbeTextStyles.specialText)
```

---

### **Cara 3: Menggunakan Theme TextTheme**

Style sudah dikonfigurasi di `main.dart`, bisa diakses via context:

```dart
Text('Heading', style: Theme.of(context).textTheme.headlineLarge)
Text('Body', style: Theme.of(context).textTheme.bodyLarge)
Text('Label', style: Theme.of(context).textTheme.labelMedium)
```

**Keuntungan:**
- ✅ Sesuai dengan Material Design guidelines
- ✅ Otomatis mengikuti theme (dark mode support)
- ✅ Bisa di-override per platform

---

### **Cara 4: Menggunakan Extension**

Import extension, lalu gunakan via context:

```dart
import 'package:ombe/styles/text_extensions.dart';

Text('Heading', style: context.ombHeadingLarge())
Text('Body', style: context.ombBodyMedium())
```

**Keuntungan:**
- ✅ Lebih clean, tidak perlu import OmbeTextStyles
- ✅ Konsisten dengan pattern Flutter

---

### **Cara 5: Modifikasi dengan copyWith**

Untuk one-off modification tanpa membuat style baru:

```dart
Text(
  'Custom',
  style: OmbeTextStyles.bodyMedium.copyWith(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  ),
)
```

---

## 📝 Daftar Style yang Tersedia

### Heading Styles
- `OmbeTextStyles.headingLarge` - 36px, bold (untuk brand name)
- `OmbeTextStyles.headingMedium` - 28px, semibold (untuk judul)
- `OmbeTextStyles.headingSmall` - 24px, semibold (untuk sub judul)

### Body Styles
- `OmbeTextStyles.bodyLarge` - 18px, regular
- `OmbeTextStyles.bodyMedium` - 16px, regular
- `OmbeTextStyles.bodySmall` - 14px, regular

### Subtitle Styles
- `OmbeTextStyles.subtitleLarge` - 18px, gray
- `OmbeTextStyles.subtitleMedium` - 16px, gray
- `OmbeTextStyles.subtitleSmall` - 14px, gray

### Button Styles
- `OmbeTextStyles.buttonLarge` - 18px, bold, uppercase (untuk primary button)
- `OmbeTextStyles.buttonMedium` - 16px, semibold
- `OmbeTextStyles.buttonSmall` - 14px, semibold, green, underlined

### Label Styles
- `OmbeTextStyles.labelMedium` - 16px, semibold, gray (untuk form labels)
- `OmbeTextStyles.labelSmall` - 14px, semibold, gray

---

## 🔧 Contoh Menambahkan Style Baru

### Step 1: Tambahkan di `text_styles.dart`

```dart
class OmbeTextStyles {
  // ... existing styles ...

  /// Style untuk harga produk
  static const TextStyle priceText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: primaryGreen,
    letterSpacing: 0.5,
  );

  /// Style untuk discount text
  static const TextStyle discountText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.red,
    decoration: TextDecoration.lineThrough,
  );
}
```

### Step 2: (Opsional) Tambahkan Extension

Di `text_extensions.dart`:

```dart
extension OmbeTextStylesExtension on BuildContext {
  // ... existing extensions ...

  TextStyle ombPriceText() => OmbeTextStyles.priceText;
  TextStyle ombDiscountText() => OmbeTextStyles.discountText;
}
```

### Step 3: Gunakan

```dart
Text('Rp 50.000', style: OmbeTextStyles.priceText)
// atau
Text('Rp 50.000', style: context.ombPriceText())
```

---

## 💡 Best Practices

1. **Gunakan OmbeTextStyles** untuk style yang akan dipakai berulang
2. **Gunakan copyWith** untuk modifikasi one-off (ubah warna, ukuran)
3. **Jangan hardcode style** langsung di widget (kecuali benar-benar one-off)
4. **Gunakan nama yang deskriptif** saat membuat style baru
5. **Tambahkan komentar** menjelaskan kapan style digunakan

---

## 📚 Contoh Lengkap

Lihat file `lib/examples/text_style_examples.dart` untuk contoh penggunaan lengkap.

Untuk melihat contoh di aplikasi, tambahkan route:

```dart
// Di main.dart atau routing file
routes: {
  '/examples': (context) => const TextStyleExamples(),
}
```

Lalu navigasi ke `/examples`.

---

## ❓ FAQ

**Q: Style mana yang harus saya gunakan?**  
A: Untuk consistency, gunakan `OmbeTextStyles`. Untuk akses via context, gunakan extension.

**Q: Bisa menambahkan custom font?**  
A: Ya! Tambahkan font di `pubspec.yaml`, lalu gunakan di TextStyle dengan `fontFamily`.

**Q: Bagaimana untuk dark mode?**  
A: Style di TextTheme otomatis mengikuti brightness. Untuk OmbeTextStyles, buat variasi dengan kondisi theme.

---

**Selamat coding! ☕**

