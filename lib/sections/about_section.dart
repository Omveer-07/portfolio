import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../utils/app_colors.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final bool isMobile = screenWidth < 700;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: isMobile ? 40 : 100,
      ),
      child: Column(
        children: [
          _IntroductionSection(isMobile: isMobile),

          const SizedBox(height: 100),

          _DetailedAboutSection(isMobile: isMobile),
        ],
      ),
    );
  }
}

class _IntroductionSection extends StatelessWidget {
  const _IntroductionSection({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
          decoration: BoxDecoration(
            color: AppColors.primary.withAlpha((255 * 0.15).round()),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.primary.withAlpha((255 * 0.5).round()),
            ),
          ),
          child: const Text(
            "Available for Opportunities",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        const SizedBox(height: 24),

        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: isMobile ? 38 : 58,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            children: const [
              TextSpan(text: "Hey! I'm "),
              TextSpan(
                text: "Omveer",
                style: TextStyle(color: AppColors.primary),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        Text(
          "Software Developer",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 22 : 30,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),

        const SizedBox(height: 24),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 650),
          child: Text(
            "I build practical mobile, web and backend applications.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 15 : 17,
              height: 1.5,
              color: AppColors.textSecondary,
            ),
          ),
        ),

        const SizedBox(height: 32),

        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text("View My Work"),
            ),

            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: AppColors.primary),
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text("Get In Touch"),
            ),
          ],
        ),
      ],
    );
  }
}

class _DetailedAboutSection extends StatelessWidget {
  const _DetailedAboutSection({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "About Me",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 28),

          if (isMobile) _MobileAboutContent() else _DesktopAboutContent(),
        ],
      ),
    );
  }
}

class _DesktopAboutContent extends StatelessWidget {
  const _DesktopAboutContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            PortfolioData.about,
            style: const TextStyle(
              fontSize: 16,
              height: 1.8,
              color: AppColors.textSecondary,
            ),
          ),
        ),

        const SizedBox(width: 70),

        const _ProfileImagePlaceholder(),
      ],
    );
  }
}

class _MobileAboutContent extends StatelessWidget {
  const _MobileAboutContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _ProfileImagePlaceholder(),

        const SizedBox(height: 35),

        Text(
          PortfolioData.about,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 15,
            height: 1.8,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _ProfileImagePlaceholder extends StatelessWidget {
  const _ProfileImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 260,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withAlpha((255 * 0.25).round()),
            blurRadius: 30,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Icon(Icons.person, size: 90, color: AppColors.primary),
    );
  }
}
