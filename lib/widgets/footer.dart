import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Transform.translate(
      offset: const Offset(0, -20),
      child: Padding(
        padding: EdgeInsets.only(
          left: isMobile ? 24 : 60,
          right: isMobile ? 24 : 60,
          top: 0,
          bottom: isMobile ? 10 : 12,
        ),
        child: Center(
          child: Text(
            '© 2026 Omveer Singh',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: isMobile ? 12 : 13,
            ),
          ),
        ),
      ),
    );
  }
}
