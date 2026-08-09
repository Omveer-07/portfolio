import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../utils/app_colors.dart';
import '../widgets/shared_components.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;

    return SectionLayout(
      isMobile: isMobile,
      title: "Skills & Technologies",
      subtitle:
          "Technologies and tools I use to build mobile and web applications.",
      contentSpacing: 32,
      child: _SkillsGrid(isMobile: isMobile),
    );
  }
}

class _SkillsGrid extends StatelessWidget {
  const _SkillsGrid({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final skills = PortfolioData.skills;

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = isMobile
            ? constraints.maxWidth
            : (constraints.maxWidth - 40) / 3;

        return Wrap(
          spacing: 20,
          runSpacing: 20,
          children: skills.entries.map((entry) {
            return SizedBox(
              width: cardWidth,
              child: _SkillCard(
                title: entry.key,
                skills: entry.value.map((skill) {
                  return {"name": skill};
                }).toList(),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _SkillCard extends StatelessWidget {
  const _SkillCard({required this.title, required this.skills});

  final String title;
  final List<Map<String, dynamic>> skills;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(18),
      borderRadius: 12,
      borderColor: AppColors.border,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 16),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((skill) {
              return _SkillChip(name: skill["name"] as String);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  const _SkillChip({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return AppChip(
      label: name,
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      textStyle: const TextStyle(fontSize: 12, color: AppColors.textPrimary),
    );
  }
}
