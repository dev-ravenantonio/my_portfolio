import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/responsive.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 120,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tech Stack & Expertise',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Technologies I use to build production-ready apps, automation systems, and scalable solutions.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.65),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 60),

          GridView.count(
            crossAxisCount: isMobile ? 2 : 4,
            shrinkWrap: true,
            mainAxisSpacing: 28,
            crossAxisSpacing: 28,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              TechCard(
                icon: 'assets/icons/flutterflow.svg',
                title: 'FlutterFlow',
                label: 'Expert',
                level: 0.95,
                description:
                    'Low-code mobile & web app development for production-ready systems.',
              ),
              TechCard(
                icon: 'assets/icons/flutter.svg',
                title: 'Flutter',
                label: 'Advanced',
                level: 0.85,
                description:
                    'Custom UI, animations, state management, and native integrations.',
              ),
              TechCard(
                icon: 'assets/icons/firebase.svg',
                title: 'Firebase',
                label: 'Advanced',
                level: 0.85,
                description:
                    'Authentication, Firestore, Cloud Functions, and hosting.',
              ),
              TechCard(
                icon: 'assets/icons/stripe.svg',
                title: 'Stripe',
                label: 'Proficient',
                level: 0.75,
                description:
                    'Secure checkout, webhooks, and payment automation flows.',
              ),
              TechCard(
                icon: 'assets/icons/servicenow.svg',
                title: 'ServiceNow',
                label: 'Advanced',
                level: 0.85,
                iconSize: 28, // smaller because original SVG is large
                description:
                    'Enterprise service portals, workflow automation, and scripting.',
              ),
              TechCard(
                icon: 'assets/icons/outsystems.svg',
                title: 'OutSystems',
                label: 'Proficient',
                level: 0.75,
                description:
                    'Low-code enterprise applications and backend integrations.',
              ),
              TechCard(
                icon: 'assets/icons/github.svg',
                title: 'GitHub',
                label: 'Advanced',
                level: 0.85,
                description:
                    'Version control, CI workflows, and team collaboration.',
              ),
              TechCard(
                icon: 'assets/icons/ai.svg',
                title: 'AI / Prompt Engineering',
                label: 'Advanced',
                level: 0.85,
                description:
                    'Prompt design, evaluation, and AI workflow automation.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TechCard extends StatefulWidget {
  final String icon;
  final String title;
  final double level;
  final String label;
  final String description;
  final double iconSize;

  const TechCard({
    super.key,
    required this.icon,
    required this.title,
    required this.level,
    required this.label,
    required this.description,
    this.iconSize = 36,
  });

  @override
  State<TechCard> createState() => _TechCardState();
}

class _TechCardState extends State<TechCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform:
            _hovered ? (Matrix4.identity()..translate(0, -6)) : null,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: const Color(0xFF020617),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _hovered
                ? Colors.blueAccent
                : Colors.white.withOpacity(0.08),
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.25),
                    blurRadius: 20,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ICON
            SvgPicture.asset(
              widget.icon,
              height: widget.iconSize,
            ),

            const SizedBox(height: 16),

            // TITLE
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 4),

            // LEVEL
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withOpacity(0.6),
              ),
            ),

            const SizedBox(height: 14),

            // PROGRESS BAR
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: widget.level,
                minHeight: 6,
                backgroundColor: Colors.white.withOpacity(0.08),
                valueColor:
                    const AlwaysStoppedAnimation(Colors.blueAccent),
              ),
            ),

            const SizedBox(height: 18),

            // LOW OPACITY DIVIDER
            Container(
              height: 1,
              color: Colors.white.withOpacity(0.05),
            ),

            const SizedBox(height: 16),

            // DESCRIPTION (NOW BELOW)
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 13,
                height: 1.6,
                color: Colors.white.withOpacity(0.55),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
