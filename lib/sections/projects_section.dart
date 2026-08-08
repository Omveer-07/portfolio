import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../utils/app_colors.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final bool isMobile = screenWidth < 700;
    final bool isTablet = screenWidth >= 700 && screenWidth < 1050;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My Projects",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Projects I've built and worked on.",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 32),

              _ProjectsGrid(
                isMobile: isMobile,
                isTablet: isTablet,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectsGrid extends StatelessWidget {
  const _ProjectsGrid({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final projects = PortfolioData.projects;

    int columns;

    if (isMobile) {
      columns = 1;
    } else if (isTablet) {
      columns = 2;
    } else {
      columns = 3;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 20.0;

        final cardWidth =
            (constraints.maxWidth - ((columns - 1) * spacing)) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: projects.map((project) {
            return SizedBox(
              width: cardWidth,
              child: _ProjectCard(
                project: project,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.project,
  });

  final Map<String, dynamic> project;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProjectImage(
            imagePath: project["image"] as String?,
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project["title"] as String,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  project["description"] as String,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.6,
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 16),

                _TechnologyChips(
                  technologies:
                      List<String>.from(project["technologies"] as List),
                ),

                const SizedBox(height: 18),

                TextButton.icon(
                  onPressed: () {
                    // GitHub link will be connected later.
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    foregroundColor: AppColors.primary,
                  ),
                  icon: const Icon(
                    Icons.arrow_outward,
                    size: 17,
                  ),
                  label: const Text(
                    "View Project",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectImage extends StatelessWidget {
  const _ProjectImage({
    required this.imagePath,
  });

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 190,
      color: AppColors.primaryDark.withOpacity(0.25),
      child: imagePath != null && imagePath!.isNotEmpty
          ? Image.asset(
              imagePath!,
              fit: BoxFit.cover,
            )
          : const Center(
              child: Icon(
                Icons.image_outlined,
                size: 55,
                color: AppColors.primary,
              ),
            ),
    );
  }
}

class _TechnologyChips extends StatelessWidget {
  const _TechnologyChips({
    required this.technologies,
  });

  final List<String> technologies;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 7,
      runSpacing: 7,
      children: technologies.map((technology) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.primary,
            ),
          ),
          child: Text(
            technology,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textPrimary,
            ),
          ),
        );
      }).toList(),
    );
  }
}