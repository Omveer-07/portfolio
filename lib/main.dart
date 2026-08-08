import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Omveer Singh Portfolio',
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}