class TechDecision {
  final String title;
  final String description;

  TechDecision({
    required this.title,
    required this.description,
  });
}

class ProjectModel {
  final String slug;
  final String title;
  final String subtitle;
  final String imagePath;
  final String role;
  final String overview;
  final String tech;
  final String details;
  final List<String> screenshots;
  final List<TechDecision> techDecisions;

  ProjectModel({
    required this.slug,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.role,
    required this.overview,
    required this.tech,
    required this.details,
    required this.screenshots,
    required this.techDecisions,
  });
}
