import 'package:flutter/material.dart';

class ProjectCard extends StatefulWidget {
  final String category;
  final String title;
  final String role;
  final String description;
  final String tech;
  final VoidCallback onTap;

  const ProjectCard({
    super.key,
    required this.category,
    required this.title,
    required this.role,
    required this.description,
    required this.tech,
    required this.onTap,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()
          ..translate(0.0, _hovered ? -8.0 : 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: _hovered
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blueAccent.withOpacity(0.08),
                    Colors.transparent,
                  ],
                )
              : null,
          border: Border.all(
            color: _hovered
                ? Colors.blueAccent.withOpacity(0.9)
                : Colors.white.withOpacity(0.08),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(_hovered ? 0.25 : 0.08),
              blurRadius: _hovered ? 30 : 16,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category
                Text(
                  widget.category.toUpperCase(),
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 1.4,
                    color: Colors.blueAccent.withOpacity(0.9),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 12),

                // Title
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),

                const SizedBox(height: 6),

                // Role
                Text(
                  widget.role,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),

                const SizedBox(height: 16),

                // Description
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.6,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),

                const Spacer(),

                // Tech + CTA
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.tech,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),

                    AnimatedSlide(
                      offset: _hovered
                          ? const Offset(0.15, 0)
                          : Offset.zero,
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        'View Case Study →',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
