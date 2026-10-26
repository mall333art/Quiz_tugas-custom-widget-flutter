// screens/login_screen.dart
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController(
    text: 'Muhammad Akmal Meiza',
  );
  final TextEditingController _nimController = TextEditingController(
    text: '3337240014',
  );

  @override
  void dispose() {
    _nameController.dispose();
    _nimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.widgets_rounded,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Portal Modul Praktikum',
                  style: AppTheme.headingStyle,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Implementasi Custom Widget & Design System pada Aplikasi Multi-Screen.',
                  style: AppTheme.bodyStyle,
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  label: 'Nama Lengkap',
                  hintText: 'Masukkan nama lengkap',
                  prefixIcon: Icons.person_outline_rounded,
                  controller: _nameController,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Nomor Induk Mahasiswa (NIM)',
                  hintText: 'Masukkan NIM',
                  prefixIcon: Icons.badge_outlined,
                  controller: _nimController,
                ),
                const SizedBox(height: 32),
                PrimaryButton(
                  text: 'Masuk ke Dashboard',
                  icon: Icons.login_rounded,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          studentName: _nameController.text.isEmpty
                              ? 'Mahasiswa'
                              : _nameController.text,
                          studentNim: _nimController.text.isEmpty
                              ? '-'
                              : _nimController.text,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
