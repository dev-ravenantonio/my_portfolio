import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final List<String> bullets;
  final Color accentColor;
  final String bestFor;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.bullets,
    required this.accentColor,
    required this.bestFor,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()
          ..translate(0.0, _hovered ? -6.0 : 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white.withOpacity(0.03),
          border: Border.all(
            color: _hovered
                ? widget.accentColor.withOpacity(0.45)
                : Colors.white.withOpacity(0.08),
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: widget.accentColor.withOpacity(0.25),
                    blurRadius: 32,
                    offset: const Offset(0, 16),
                  ),
                ]
              : [],
        ),
        child: Stack(
          children: [
            // Ambient glow
            Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: RadialGradient(
                      colors: [
                        widget.accentColor.withOpacity(0.08),
                        Colors.transparent,
                      ],
                      radius: 0.9,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(28),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Accent stripe
                  Container(
                    width: 4,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          widget.accentColor,
                          widget.accentColor.withOpacity(0.1),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),

                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon badge
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: widget.accentColor.withOpacity(0.12),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    widget.accentColor.withOpacity(0.35),
                                blurRadius: 18,
                              ),
                            ],
                          ),
                          child: Icon(
                            widget.icon,
                            size: 28,
                            color: widget.accentColor,
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.description,
                          style: TextStyle(
                            height: 1.6,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(height: 20),

                        ...widget.bullets.map(
                          (bullet) => Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10),
                            child: Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  size: 16,
                                  color: widget.accentColor,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    bullet,
                                    style: TextStyle(
                                      height: 1.5,
                                      color: Colors.white
                                          .withOpacity(0.8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Best for badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                Colors.white.withOpacity(0.06),
                          ),
                          child: Text(
                            'Best for: ${widget.bestFor}',
                            style: TextStyle(
                              fontSize: 12,
                              color:
                                  Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
