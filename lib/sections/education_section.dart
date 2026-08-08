import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

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
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Education",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 30),

              _EducationContainer(isMobile: isMobile),
            ],
          ),
        ),
      ),
    );
  }
}

class _EducationContainer extends StatelessWidget {
  const _EducationContainer({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: isMobile ? double.infinity : 800,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 32,
          vertical: isMobile ? 24 : 32,
        ),
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border(
            top: BorderSide(color: AppColors.border, width: 1),
            right: BorderSide(color: AppColors.border, width: 1),
            bottom: BorderSide(color: AppColors.border, width: 1),
          ),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(65),
            bottomRight: Radius.circular(65),
          ),
        ),
        child: isMobile
            ? const _MobileEducationTimeline()
            : const _DesktopEducationTimeline(),
      ),
    );
  }
}

class _DesktopEducationTimeline extends StatelessWidget {
  const _DesktopEducationTimeline();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _DesktopEducationItem(
          date: "2023 – 2027",
          institution: "ICFAI University, Jaipur",
          course: "B.Tech – Computer Science & Engineering",
          isLast: false,
        ),

        _DesktopEducationItem(
          date: "2022 – 2023",
          institution: "Kendriya Vidyalaya, Alwar",
          course: "12th Standard – PCM",
          isLast: true,
        ),
      ],
    );
  }
}

class _DesktopEducationItem extends StatelessWidget {
  const _DesktopEducationItem({
    required this.date,
    required this.institution,
    required this.course,
    required this.isLast,
  });

  final String date;
  final String institution;
  final String course;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date
          SizedBox(
            width: 150,
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Text(
                date,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),

          const SizedBox(width: 20),

          // Timeline
          SizedBox(
            width: 20,
            child: Column(
              children: [
                Container(
                  width: 9,
                  height: 9,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                ),

                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 1.5,
                      margin: const EdgeInsets.only(top: 5),
                      color: AppColors.primaryDark,
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 22),

          // Education card
          SizedBox(
            width: 430,
            child: Container(
              margin: EdgeInsets.only(bottom: isLast ? 0 : 24),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border, width: 0.8),
              ),
              child: _EducationContent(
                institution: institution,
                course: course,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EducationContent extends StatelessWidget {
  const _EducationContent({required this.institution, required this.course});

  final String institution;
  final String course;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          institution,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: 7),

        Text(
          course,
          style: const TextStyle(fontSize: 15, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}

class _MobileEducationTimeline extends StatelessWidget {
  const _MobileEducationTimeline();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _MobileEducationItem(
          date: "2023 – 2027",
          institution: "ICFAI University, Jaipur",
          course: "B.Tech – Computer Science & Engineering",
        ),

        const SizedBox(height: 30),

        _MobileEducationItem(
          date: "2022 – 2023",
          institution: "Kendriya Vidyalaya, Alwar",
          course: "12th Standard – PCM",
        ),
      ],
    );
  }
}

class _MobileEducationItem extends StatelessWidget {
  const _MobileEducationItem({
    required this.date,
    required this.institution,
    required this.course,
  });

  final String date;
  final String institution;
  final String course;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: 9,
          height: 9,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                institution,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                course,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
