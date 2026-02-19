class ProjectModel {
  final String title;
  final String subtitle;
  final String imagePath;
  final String role;
  final String overview;
  final String tech;
  final String details;
  final List<String> screenshots;

  ProjectModel({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.role,
    required this.overview,
    required this.tech,
    required this.details,
    required this.screenshots,
  });
}
