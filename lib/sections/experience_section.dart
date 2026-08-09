import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../models/experience_model.dart';
import '../utils/app_colors.dart';
import '../widgets/shared_components.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;

    return SectionLayout(
      isMobile: isMobile,
      title: "Experience",
      subtitle: "My internship experience",
      contentSpacing: 40,
      child: isMobile
          ? const _MobileExperienceList()
          : const _DesktopExperienceList(),
    );
  }
}

class _DesktopExperienceList extends StatelessWidget {
  const _DesktopExperienceList();

  @override
  Widget build(BuildContext context) {
    final experiences = PortfolioData.experiences;

    return Column(
      children: List.generate(experiences.length, (index) {
        return _DesktopExperienceItem(
          experience: experiences[index],
          isLast: index == experiences.length - 1,
        );
      }),
    );
  }
}

class _DesktopExperienceItem extends StatelessWidget {
  const _DesktopExperienceItem({
    required this.experience,
    required this.isLast,
  });

  final ExperienceModel experience;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date
          SizedBox(
            width: 220,
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                experience.date,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          const SizedBox(width: 20),

          // Timeline
          SizedBox(
            width: 24,
            child: Column(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                ),

                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.only(top: 6),
                      color: AppColors.primaryDark,
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 24),

          // Experience card
          Expanded(child: _ExperienceCard(experience: experience)),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard({required this.experience});

  final ExperienceModel experience;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(bottom: 32),
      borderRadius: 14,
      borderColor: AppColors.border,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.role,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            experience.company,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            experience.description,
            style: const TextStyle(
              fontSize: 15,
              height: 1.7,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileExperienceList extends StatelessWidget {
  const _MobileExperienceList();

  @override
  Widget build(BuildContext context) {
    final experiences = PortfolioData.experiences;

    return Column(
      children: List.generate(experiences.length, (index) {
        final experience = experiences[index];

        return Padding(
          padding: EdgeInsets.only(
            bottom: index == experiences.length - 1 ? 0 : 28,
          ),
          child: _MobileExperienceItem(experience: experience),
        );
      }),
    );
  }
}

class _MobileExperienceItem extends StatelessWidget {
  const _MobileExperienceItem({required this.experience});

  final ExperienceModel experience;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          experience.date,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),

        const SizedBox(height: 10),

        _ExperienceCard(experience: experience),
      ],
    );
  }
}
