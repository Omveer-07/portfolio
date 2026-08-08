import 'package:flutter/material.dart';

import '../models/project_model.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
  });

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1E293B),
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Project Image
          Container(
            height: 180,
            width: double.infinity,
            color: Colors.grey.shade800,
            child: const Center(
              child: Icon(
                Icons.image,
                size: 60,
                color: Colors.white54,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Project Title
                Text(
                  project.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                // Project Description 
                Text(
                  project.description,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Technologies Used",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 12),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: project.technologies
                      .map(
                        (tech) => Chip(
                          label: Text(tech),
                        ),
                      )
                      .toList(),
                ),

                const SizedBox(height: 24),

                Row(
                  children: [

                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // TODO:
                        },
                        icon: const Icon(Icons.code),
                        label: const Text("GitHub"),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // TODO:
                        },
                        icon: const Icon(Icons.open_in_new),
                        label: Text(
                          project.liveDemoUrl.isEmpty
                              ? "Coming Soon"
                              : "Live Demo",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}