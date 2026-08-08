import 'package:flutter/material.dart';

import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/experience_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';

import '../sections/education_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AboutSection(),
            EducationSection(),
            SkillsSection(),
            ExperienceSection(),
            ProjectsSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}