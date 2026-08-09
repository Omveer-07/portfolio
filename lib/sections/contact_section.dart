import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/app_colors.dart';
import '../widgets/shared_components.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  static const String email = "omsingh.btech2023@iujaipur.edu.in";
  static const String phone = "9257763670";
  static const String linkedinUrl = "https://www.linkedin.com/in/omveersingh07";
  static const String githubUrl = "https://github.com/Omveer-07";
  static const String whatsappUrl = "https://wa.me/9257763670";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: 40,
      ),
      child: Column(
        children: [
          _buildDivider(),

          const SizedBox(height: 55),

          const Text(
            "Contact Me",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 12),

          Container(
            width: 120,
            height: 3,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 45),

          _ContactCards(isMobile: isMobile),

          const SizedBox(height: 55),

          _SocialLinks(isMobile: isMobile),

          const SizedBox(height: 60),

          _buildDivider(),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: AppColors.textSecondary.withAlpha((255 * 0.25).round()),
    );
  }

  static Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}

class _ContactCards extends StatelessWidget {
  const _ContactCards({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Column(
        children: [
          _ContactCard(
            icon: Icons.email_outlined,
            title: "Email Me",
            value: ContactSection.email,
            url: "mailto:${ContactSection.email}?subject=Hello%20Omveer",
          ),

          const SizedBox(height: 20),

          _ContactCard(
            icon: Icons.phone_outlined,
            title: "Call Me",
            value: ContactSection.phone,
            url: "tel:${ContactSection.phone}",
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 360,
          child: _ContactCard(
            icon: Icons.email_outlined,
            title: "Email Me",
            value: ContactSection.email,
            url: "mailto:${ContactSection.email}?subject=Hello%20Omveer",
          ),
        ),

        const SizedBox(width: 40),

        SizedBox(
          width: 360,
          child: _ContactCard(
            icon: Icons.phone_outlined,
            title: "Call Me",
            value: ContactSection.phone,
            url: "tel:${ContactSection.phone}",
          ),
        ),
      ],
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.url,
  });

  final IconData icon;
  final String title;
  final String value;
  final String url;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      borderRadius: 16,
      borderColor: AppColors.border,
      onTap: () => ContactSection._launchUrl(url),
      child: Column(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary, width: 1),
            ),
            child: Icon(icon, size: 28, color: AppColors.primary),
          ),

          const SizedBox(height: 18),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialLinks extends StatelessWidget {
  const _SocialLinks({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final socialLinks = [
      _SocialItem(
        icon: Icons.code,
        name: "GitHub",
        url: ContactSection.githubUrl,
      ),
      _SocialItem(
        icon: Icons.business_center_outlined,
        name: "LinkedIn",
        url: ContactSection.linkedinUrl,
      ),
      _SocialItem(
        icon: Icons.chat_outlined,
        name: "WhatsApp",
        url: ContactSection.whatsappUrl,
      ),
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: isMobile ? 35 : 80,
      runSpacing: 30,
      children: socialLinks,
    );
  }
}

class _SocialItem extends StatelessWidget {
  const _SocialItem({
    required this.icon,
    required this.name,
    required this.url,
  });

  final IconData icon;
  final String name;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ContactSection._launchUrl(url),
      child: Column(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary, width: 1),
            ),
            child: Icon(icon, size: 34, color: AppColors.textPrimary),
          ),

          const SizedBox(height: 12),

          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
