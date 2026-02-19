import 'package:flutter/material.dart';

import 'project_model.dart';

class ProjectPreviewCard extends StatefulWidget {
  final ProjectModel project;
  const ProjectPreviewCard({super.key, required this.project});

  @override
  State<ProjectPreviewCard> createState() => _ProjectPreviewCardState();
}

class _ProjectPreviewCardState extends State<ProjectPreviewCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _hovered
            ? (Matrix4.identity()..translate(0, -8))
            : Matrix4.identity(),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/project-detail',
              arguments: widget.project,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF020617),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _hovered
                    ? Colors.blueAccent
                    : Colors.white10,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20)),
                  child: Image.asset(
                    widget.project.imagePath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.project.title,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(widget.project.subtitle,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.blueAccent)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
