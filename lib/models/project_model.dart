class ProjectModel {
  final String title;
  final String description;
  final List<String> technologies;
  final String image;
  final String githubUrl;
  final String liveDemoUrl;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.technologies,
    required this.image,
    required this.githubUrl,
    required this.liveDemoUrl,
  });
}