// screens/home_screen.dart
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final String studentName;
  final String studentNim;

  const HomeScreen({
    super.key,
    required this.studentName,
    required this.studentNim,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> modules = [
      {
        'title': 'Arsitektur Custom Widget',
        'category': 'UI/UX & Komponen',
        'description': 'Membangun komponen tombol, input teks, dan kartu yang konsisten di seluruh layar aplikasi.',
        'icon': Icons.layers_rounded,
        'duration': '120 Menit',
      },
      {
        'title': 'Manajemen Tema & Tipografi',
        'category': 'Design System',
        'description': 'Standarisasi Primary Font, palet warna utama, dan hierarki teks terpusat.',
        'icon': Icons.palette_rounded,
        'duration': '90 Menit',
      },
      {
        'title': 'Navigasi Multi-Screen',
        'category': 'State & Routing',
        'description': 'Pengiriman data antar layar menggunakan konstruktor dan rute halaman secara terstruktur.',
        'icon': Icons.route_rounded,
        'duration': '100 Menit',
      },
    ];

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: const CustomAppBar(title: 'Dashboard Modul', showBack: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, $studentName',
                  style: AppTheme.subHeadingStyle.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  'NIM: $studentNim • Informatika UNTIRTA',
                  style: AppTheme.bodyStyle.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Daftar Modul Pembelajaran',
            style: AppTheme.subHeadingStyle,
          ),
          const SizedBox(height: 4),
          const Text(
            'Pilih salah satu modul di bawah untuk melihat detail materi.',
            style: AppTheme.bodyStyle,
          ),
          const SizedBox(height: 16),
          ...modules.map(
            (item) => CustomCard(
              title: item['title'],
              category: item['category'],
              description: item['description'],
              icon: item['icon'],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(moduleData: item),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
