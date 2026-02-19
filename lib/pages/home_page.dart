// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../sections/pre_footer_cta.dart';
import '../sections/selected_projects_section.dart';
import '../widgets/animated_glow_divider.dart';
import '../widgets/back_to_top_button.dart';
import '../widgets/footer.dart';
import '../widgets/navbar.dart';
import '../utils/responsive.dart';
import '../widgets/orbiting_particle.dart';
import '../widgets/particles_background.dart';
import '../widgets/primary_home_button.dart';
import '../widgets/slide_fade_in.dart';
import '../widgets/tech_stack_section.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          const _AbstractBackground(),

          // Particles
          const ParticlesBackground(),

          // Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: const [
                Navbar(),
                _HeroSection(),
                SizedBox(height: 40),
                TechStackSection(),
                SizedBox(height: 60),
                AnimatedGlowDivider(),
                SelectedProjectsSection(),
                PreFooterCTA(),
                AnimatedGlowDivider(),
                Footer(),
              ],
            ),
          ),
          Positioned(
            right: 24,
            bottom: 24,
            child: BackToTopButton(controller: _scrollController),
          ),
        ],
      ),
    );
  }
}

/// ===============================
/// HERO SECTION
/// ===============================
class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 80 : 120,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: isMobile ? _mobileLayout(context) : _desktopLayout(context),
      ),
    );
  }

  /// ===============================
  /// DESKTOP LAYOUT
  /// ===============================
  Widget _desktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // LEFT — IMAGE (slide from left)
        Expanded(
          flex: 5,
          child: SlideFadeIn(
            beginOffset: const Offset(-0.25, 0),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Outer glow ring
                  Container(
                    width: 320,
                    height: 320,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Colors.blueAccent.withOpacity(0.25),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),

                  // Orbiting particles
                  const OrbitingParticle(
                    radius: 150,
                    size: 6,
                    duration: Duration(seconds: 6),
                    color: Colors.blueAccent,
                  ),
                  const OrbitingParticle(
                    radius: 150,
                    size: 4,
                    duration: Duration(seconds: 4),
                    color: Colors.purpleAccent,
                  ),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: -6, end: 6),
                    duration: const Duration(seconds: 6),
                    curve: Curves.easeInOut,
                    builder: (_, value, child) {
                      return Transform.translate(
                        offset: Offset(0, value),
                        child: child,
                      );
                    },
                    child: Container(
                      width: 260,
                      height: 260,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent.withOpacity(0.35),
                            blurRadius: 50,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile_hero.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 48), // 👈 closer than before
        // RIGHT — TEXT (slide from right)
        Expanded(
          flex: 6,
          child: SlideFadeIn(
            beginOffset: const Offset(0.25, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Accent line
                Container(
                  width: 3,
                  height: 210,
                  margin: const EdgeInsets.only(right: 24, top: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blueAccent,
                        Colors.blueAccent.withOpacity(0.1),
                      ],
                    ),
                  ),
                ),

                // Text content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FLUTTERFLOW • AI • AUTOMATION',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          letterSpacing: 1.4,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Hi, I’m Raven Antonio',
                        style: TextStyle(
                          fontSize: 56, // slightly bigger
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Low-Code Developer building scalable apps\n& AI-powered workflows',
                        style: TextStyle(
                          fontSize: 28,
                          height: 1.35,
                          color: Colors.white.withOpacity(0.85),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 22),
                      Text(
                        'I build scalable mobile apps, e-commerce systems, '
                        'and AI-powered workflows using FlutterFlow, Firebase, '
                        'and modern automation.',
                        style: TextStyle(
                          fontSize: 17,
                          height: 1.6,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 34),
                      Row(
                        children: [
                          PrimaryHomeButton(
                            label: "Hire Me",
                            svgPath: "assets/icons/handshake.svg",
                            onPressed: () {
                              Navigator.pushNamed(context, '/contact');
                            },
                          ),
                          const SizedBox(width: 18),
                          SecondaryHomeButton(
                            label: "View Projects",
                            svgPath: "assets/icons/files.svg",
                            onPressed: () {
                              Navigator.pushNamed(context, '/projects');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// ===============================
  /// MOBILE LAYOUT (FIXED)
  /// ===============================
  Widget _mobileLayout(BuildContext context) {
    return Column(
      children: [
        // Image
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.blueAccent.withOpacity(0.25),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.35),
                    blurRadius: 50,
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile_hero.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 40),

        // Text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FLUTTERFLOW • AI • AUTOMATION',
              style: TextStyle(
                color: Colors.blueAccent,
                letterSpacing: 1.4,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Hi, I’m Raven Antonio',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'FlutterFlow Developer\nAI Workflow Automation Specialist',
              style: TextStyle(
                fontSize: 22,
                height: 1.4,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'I build scalable mobile apps, e-commerce systems, '
              'and AI-powered workflows using FlutterFlow and automation.',
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.white.withOpacity(0.65),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/contact');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text('Hire Me'),
            ),
          ],
        ),
      ],
    );
  }
}

/// ===============================
/// ABSTRACT BACKGROUND
/// ===============================
class _AbstractBackground extends StatelessWidget {
  const _AbstractBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF020617), Color(0xFF020617), Color(0xFF020617)],
        ),
      ),
      child: Stack(
        children: [
          _blurCircle(
            top: -140,
            left: -140,
            size: 320,
            color: Colors.blueAccent.withOpacity(0.12),
          ),
          _blurCircle(
            bottom: -160,
            right: -160,
            size: 360,
            color: Colors.purpleAccent.withOpacity(0.12),
          ),
        ],
      ),
    );
  }

  Widget _blurCircle({
    double? top,
    double? bottom,
    double? left,
    double? right,
    required double size,
    required Color color,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
