import 'package:flutter/material.dart';
import 'ui/login_page.dart';
import 'ui/signup_page.dart';
import 'styles/text_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ombe',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryGreen,
          primary: primaryGreen,
          secondary: primaryGreen,
          brightness: Brightness.light,
        ),
        // Menambahkan style teks ke TextTheme
        // Font Pepi akan digunakan setelah file font ditambahkan dan di-uncomment di pubspec.yaml
        // Sekarang bisa diakses dengan: Theme.of(context).textTheme.headlineLarge
        textTheme: const TextTheme(
          // Display styles (untuk judul besar)
          displayLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black87),
          displayMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.w600, color: Colors.black87),
          displaySmall: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: Colors.black87),
          
          // Headline styles (untuk judul)
          headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black87),
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
          headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
          
          // Title styles (untuk sub judul)
          titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
          titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
          
          // Body styles (untuk paragraf)
          bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black87, height: 1.5),
          bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black87, height: 1.5),
          bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black87, height: 1.4),
          
          // Label styles (untuk label form)
          labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: subtitleColor),
          labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: subtitleColor),
          labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: subtitleColor),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: UnderlineInputBorder(),
        ),
        useMaterial3: true,
      ),
      routes: {
        SignUpPage.routeName: (context) => const SignUpPage(),
      },
      home: const LoginPage(),
    );
  }
}

