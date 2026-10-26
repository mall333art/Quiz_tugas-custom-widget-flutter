// main.dart
import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const CustomWidgetApp());
}

class CustomWidgetApp extends StatelessWidget {
  const CustomWidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Custom Widget',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppTheme.primaryFont,
        colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.primaryColor),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
