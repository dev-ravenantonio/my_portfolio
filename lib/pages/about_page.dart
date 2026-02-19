import 'package:flutter/material.dart';
import '../widgets/cert_item.dart';
import '../widgets/navbar.dart';
import '../widgets/animated_entry.dart';
import '../utils/responsive.dart';
import '../widgets/simple_footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 80,
                vertical: isMobile ? 60 : 80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ===============================
                  /// HEADER
                  /// ===============================
                  AnimatedEntry(
                    child: Text(
                      'About',
                      style: TextStyle(
                        fontSize: isMobile ? 32 : 42,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.4,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  AnimatedEntry(
                    offset: const Offset(0, 0.08),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 820),
                      child: Text(
                        'I’m Raven Antonio - a Low-Code Developer specializing in FlutterFlow, '
                        'mobile & web applications, and AI workflow automation.',
                        style: TextStyle(
                          fontSize: isMobile ? 18 : 22,
                          height: 1.5,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  AnimatedEntry(
                    offset: const Offset(0, 0.08),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: Text(
                        'I work with startups, enterprises, and digital teams to design and deliver '
                        'production-ready applications, automate complex workflows, and integrate '
                        'AI systems that are reliable, scalable, and maintainable.',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.7,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),

                  _SectionDivider(),

                  const SizedBox(height: 50),

                  /// ===============================
                  /// SPECIALIZATIONS
                  /// ===============================
                  AnimatedEntry(
                    offset: const Offset(0, 0.08),
                    child: Text(
                      'What I Specialize In',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  AnimatedEntry(
                    offset: const Offset(0, 0.08),
                    child: Wrap(
                      spacing: 40,
                      runSpacing: 20,
                      children: const [
                        _Capability(
                          title: 'Application Development',
                          items: [
                            'FlutterFlow & Flutter (mobile & web)',
                            'Production-ready UI & architecture',
                          ],
                        ),
                        _Capability(
                          title: 'Backend & Integrations',
                          items: [
                            'Firebase & Cloud Functions',
                            'APIs, Stripe & payment workflows',
                          ],
                        ),
                        _Capability(
                          title: 'AI & Automation',
                          items: [
                            'AI workflow automation',
                            'Prompt engineering & evaluation',
                          ],
                        ),
                        _Capability(
                          title: 'Enterprise Platforms',
                          items: [
                            'ServiceNow & OutSystems',
                            'Workflow & system integration',
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 70),

                  _SectionDivider(),

                  const SizedBox(height: 50),

                  /// ===============================
                  /// PROFESSIONAL BACKGROUND
                  /// ===============================
                  AnimatedEntry(
                    offset: const Offset(0, 0.08),
                    child: Text(
                      'Professional Background',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  AnimatedEntry(
                    offset: const Offset(0, 0.08),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: Text(
                        'I’ve worked across freelance, consulting, and enterprise environments — '
                        'from Japan-based e-commerce platforms to large-scale ServiceNow implementations '
                        'for international clients. My experience spans hands-on development, automation, '
                        'system integration, and client-facing delivery.',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.7,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 70),

                  _SectionDivider(),

                  const SizedBox(height: 50),

                  /// ===============================
                  /// CERTIFICATIONS & TOOLS
                  /// ===============================
                  AnimatedEntry(
                    offset: const Offset(0, 0.08),
                    child: Text(
                      'Certifications & Tools',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  AnimatedEntry(
                    offset: const Offset(0, 0.08),
                    child: Wrap(
                      spacing: 28,
                      runSpacing: 28,
                      children: const [
                        CertItem(
                          iconPath: 'assets/images/servicenow/csa.png',
                          label: 'ServiceNow Administrator',
                          url: 'https://drive.google.com/file/d/1qQ0rN92DDJkkzKO2rJKbUiRS5sIUOuuJ/view?usp=sharing',
                        ),
                        CertItem(
                          iconPath: 'assets/images/outsystems/oscert.png',
                          label: 'OutSystems Reactive Developer',
                          url:
                              'https://drive.google.com/file/d/1pAAkKJiLXX0nOmTZgyUjxKLw9GExkxE3/view?usp=sharing',
                        ),
                        CertItem(
                          iconPath: 'assets/images/outsystems/odccert1.png',
                          label: 'OutSystems Developer Cloud',
                          url:
                              'https://drive.google.com/file/d/1pAAkKJiLXX0nOmTZgyUjxKLw9GExkxE3/view?usp=sharing',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const SimpleFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ===============================
/// SMALL COMPONENTS
/// ===============================

class _SectionDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(color: Colors.white.withOpacity(0.08), thickness: 1);
  }
}

class _Capability extends StatelessWidget {
  final String title;
  final List<String> items;

  const _Capability({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle,
                    size: 16,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Tool extends StatelessWidget {
  final String text;

  const Tool(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.white.withOpacity(0.06),
      label: Text(
        text,
        style: TextStyle(color: Colors.white.withOpacity(0.75)),
      ),
    );
  }
}
