import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/animated_entry.dart';
import 'package:my_portfolio/widgets/animated_glow_divider.dart';
import '../utils/responsive.dart';
import '../widgets/app_page_wrapper.dart';
import '../widgets/footer.dart';
import '../widgets/navbar.dart';
import '../widgets/service_card.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
Widget build(BuildContext context) {
  final isMobile = Responsive.isMobile(context);

  return AppPageWrapper(
    child: SingleChildScrollView(
      child: Column(
        children: [
          const Navbar(),

          /// ===============================
          /// HEADER
          /// ===============================
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 40,
              vertical: isMobile ? 80 : 100,
            ),
            child: Column(
              children: [
                Text(
                  'Services',
                  style: TextStyle(
                    fontSize: isMobile ? 36 : 48,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: Text(
                    'I help businesses build scalable applications, automate workflows, '
                    'and integrate AI-powered systems using modern, production-ready platforms.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.6,
                      color: Colors.white.withOpacity(0.75),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// ===============================
          /// SERVICES GRID
          /// ===============================
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 40,
            ),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: Responsive.isDesktop(context)
                  ? 3
                  : Responsive.isTablet(context)
                      ? 2
                      : 1,
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
              children: const [
                AnimatedEntry(
                  offset: Offset(0, 0.1),
                  child: ServiceCard(
                    icon: Icons.phone_iphone,
                    title: 'FlutterFlow App Development',
                    description:
                        'Production-ready mobile and web apps built with FlutterFlow and Firebase.',
                    bullets: [
                      'E-commerce apps (cart, checkout, orders)',
                      'Stripe payment integration',
                      'Firebase & Cloud Functions backend',
                      'iOS & Google Play deployment',
                    ],
                    accentColor: Color(0xFF4F8CFF),
                    bestFor: 'Startups & SaaS',
                  ),
                ),
                AnimatedEntry(
                  offset: Offset(0, 0.1),
                  child: ServiceCard(
                    icon: Icons.smart_toy,
                    title: 'AI Workflow Automation',
                    description:
                        'Designing and evaluating AI-driven workflows that scale reliably.',
                    bullets: [
                      'Prompt engineering & evaluation',
                      'Automation using APIs & webhooks',
                      'AI output validation & QA',
                      'Confidential, guideline-based delivery',
                    ],
                    accentColor: Color(0xFF8B5CF6),
                    bestFor: 'Automation-heavy teams',
                  ),
                ),
                AnimatedEntry(
                  offset: Offset(0, 0.1),
                  child: ServiceCard(
                    icon: Icons.business,
                    title: 'Enterprise Low-Code Solutions',
                    description:
                        'Enterprise-grade systems built with ServiceNow and OutSystems.',
                    bullets: [
                      'Employee service portals',
                      'Workflow & process automation',
                      'Integration with external systems',
                      'Enterprise UI customization',
                    ],
                    accentColor: Color(0xFF22C55E),
                    bestFor: 'Enterprises',
                  ),
                ),
              ],
            ),
          ),

          /// ===============================
          /// DIVIDER
          /// ===============================
          const SizedBox(height: 80),
          const AnimatedGlowDivider(),
          const SizedBox(height: 80),

          /// ===============================
          /// CTA
          /// ===============================
          Padding(
            padding: EdgeInsets.only(
              bottom: isMobile ? 80 : 120,
            ),
            child: Column(
              children: [
                Text(
                  'Have a project in mind?',
                  style: TextStyle(
                    fontSize: isMobile ? 26 : 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Let’s discuss how we can build something effective and scalable.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 32),
                _ServicesCtaButton(
                  label: 'Let’s Work Together',
                  onPressed: () {
                    Navigator.pushNamed(context, '/contact');
                  },
                ),
              ],
            ),
          ),

          const Footer(),
        ],
      ),
    ),
  );
}
}


/// ===============================
/// CTA BUTTON
/// ===============================
class _ServicesCtaButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const _ServicesCtaButton({
    required this.label,
    required this.onPressed,
  });

  @override
  State<_ServicesCtaButton> createState() => _ServicesCtaButtonState();
}

class _ServicesCtaButtonState extends State<_ServicesCtaButton> {
  bool _hovered = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) {
          setState(() => _pressed = false);
          widget.onPressed();
        },
        onTapCancel: () => setState(() => _pressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 16,
          ),
          transform: Matrix4.identity()
            ..translate(0.0, _pressed ? 2.0 : 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF4F8CFF),
                Color(0xFF3B6FFF),
              ],
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: const Color(0xFF4F8CFF)
                          .withOpacity(0.45),
                      blurRadius: 28,
                      offset: const Offset(0, 12),
                    ),
                  ]
                : [],
          ),
          child: Text(
            widget.label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
