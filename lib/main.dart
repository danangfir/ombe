import 'package:flutter/material.dart';
import 'ui/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF0A7A56);
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
        textTheme: const TextTheme(
          displaySmall: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          headlineMedium: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          bodyLarge: TextStyle(color: Color(0xFF6B6B6B)),
          bodyMedium: TextStyle(color: Color(0xFF6B6B6B)),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: UnderlineInputBorder(),
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

