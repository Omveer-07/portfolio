import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'shared_components.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      width: 120,
      height: 120,
      borderRadius: 16,
      color: AppColors.card,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),

          const SizedBox(height: 16),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
