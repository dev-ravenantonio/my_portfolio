import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/animated_entry.dart';
import 'package:my_portfolio/widgets/footer.dart';
import '../models/project_model.dart';
import '../utils/responsive.dart';
import '../widgets/navbar.dart';
import '../widgets/screenshot_gallery.dart';
import '../widgets/app_page_wrapper.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final project = ModalRoute.of(context)?.settings.arguments as ProjectModel?;

    if (project == null) {
      return const Scaffold(
        body: Center(
          child: Text(
            'Project not found.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    final isMobile = Responsive.isMobile(context);

    return AppPageWrapper(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),
            _breadcrumb(context, project),
            _HeroSection(project: project),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 80,
                vertical: 60,
              ),
              child: isMobile
                  ? _MobileContent(project: project)
                  : _DesktopContent(project: project),
            ),
            SizedBox(height: 60),
            Footer(),
          ],
        ),
      ),
    );
  }
}

/* ===============================
   HERO
================================ */
class _HeroSection extends StatelessWidget {
  final ProjectModel project;

  const _HeroSection({required this.project});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final height = isMobile ? 260.0 : 420.0;

    return Stack(
      children: [
        Image.asset(
          project.imagePath,
          height: height,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black.withOpacity(0.3), const Color(0xFF0F172A)],
            ),
          ),
        ),
        Positioned(
          bottom: 32,
          left: isMobile ? 20 : 80,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.title,
                style: TextStyle(
                  fontSize: isMobile ? 28 : 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                project.subtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.75),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: project.tech
                    .split('•')
                    .map(
                      (t) => Chip(
                        label: Text(t.trim()),
                        backgroundColor: Colors.white.withOpacity(0.08),
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/* ===============================
   DESKTOP CONTENT
================================ */
class _DesktopContent extends StatelessWidget {
  final ProjectModel project;

  const _DesktopContent({required this.project});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: _MainContent(project: project)),
        const SizedBox(width: 60),
        Expanded(flex: 1, child: _StickyMeta(project: project)),
      ],
    );
  }
}

/* ===============================
   MOBILE CONTENT
================================ */
class _MobileContent extends StatelessWidget {
  final ProjectModel project;

  const _MobileContent({required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _MainContent(project: project),
        const SizedBox(height: 32),
        _MetaCard(project: project),
      ],
    );
  }
}

/* ===============================
   MAIN CONTENT
================================ */
class _MainContent extends StatelessWidget {
  final ProjectModel project;

  const _MainContent({required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedEntry(
          offset: const Offset(0, 0.08),
          child: _Section(title: 'Overview', content: project.overview),
        ),
        AnimatedEntry(
          offset: const Offset(0, 0.08),
          child: _Section(title: 'What I Built', content: project.details),
        ),
        AnimatedEntry(
          offset: const Offset(0, 0.08),
          child: _TechDecisions(project: project),
        ),
        AnimatedEntry(
          offset: const Offset(0, 0.08),
          child: _KeyOutcomes(project: project),
        ),
        const SizedBox(height: 48),
        const Text(
          'Project Screenshots',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ScreenshotGallery(images: project.screenshots),
        _RelatedProjects(current: project),
      ],
    );
  }
}

/* ===============================
   STICKY META (DESKTOP)
================================ */
class _StickyMeta extends StatelessWidget {
  final ProjectModel project;

  const _StickyMeta({required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        _MetaCard(project: project),
      ],
    );
  }
}

/* ===============================
   META CARD
================================ */
class _MetaCard extends StatelessWidget {
  final ProjectModel project;

  const _MetaCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.035),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MetaItem(label: 'Role', value: project.role),
          _MetaItem(label: 'Tech Stack', value: project.tech),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.6, end: 1),
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              builder: (_, value, child) {
                return Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20 * value,
                        color: Colors.blueAccent.withOpacity(0.25 * value),
                      ),
                    ],
                  ),
                  child: child,
                );
              },
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/contact');
                },
                child: const Text('Discuss Similar Project'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ===============================
   REUSABLE UI
================================ */
class _Section extends StatelessWidget {
  final String title;
  final String content;

  const _Section({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 13,
              letterSpacing: 1.2,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16,
              height: 1.7,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

class _TechDecisions extends StatelessWidget {
  final ProjectModel project;

  const _TechDecisions({required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TECH DECISIONS',
            style: TextStyle(
              fontSize: 13,
              letterSpacing: 1.2,
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          _decisionItem(
            title: 'FlutterFlow',
            description:
                'Used for rapid iteration and maintainable cross-platform development '
                'while keeping full control over logic and architecture.',
          ),
          _decisionItem(
            title: 'Firebase',
            description:
                'Chosen for its scalable, serverless backend, real-time data handling, '
                'and seamless integration with mobile applications.',
          ),
          _decisionItem(
            title: 'Stripe',
            description:
                'Integrated for secure, PCI-compliant payment processing with webhook-based '
                'status handling and production reliability.',
          ),
        ],
      ),
    );
  }

  Widget _decisionItem({required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•', style: TextStyle(fontSize: 18)),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Colors.white70,
                ),
                children: [
                  TextSpan(
                    text: '$title — ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _KeyOutcomes extends StatelessWidget {
  final ProjectModel project;

  const _KeyOutcomes({required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'KEY OUTCOMES',
            style: TextStyle(
              fontSize: 13,
              letterSpacing: 1.2,
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),

          _outcomeItem(
            title: 'Production-ready deployment',
            description:
                'Successfully deployed to both iOS App Store and Google Play Store '
                'with stable releases and ongoing updates.',
          ),
          _outcomeItem(
            title: 'Scalable backend architecture',
            description:
                'Designed Firestore data models and Cloud Functions that scale with '
                'increasing users and transactions.',
          ),
          _outcomeItem(
            title: 'Secure payment processing',
            description:
                'Implemented Stripe payments with webhook validation to ensure '
                'accurate order status and transaction integrity.',
          ),
          _outcomeItem(
            title: 'Operational efficiency',
            description:
                'Reduced manual workflows by automating order handling, notifications, '
                'and backend processes.',
          ),
        ],
      ),
    );
  }

  Widget _outcomeItem({required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Colors.white70,
                ),
                children: [
                  TextSpan(
                    text: '$title — ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetaItem extends StatelessWidget {
  final String label;
  final String value;

  const _MetaItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 1.1,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}

/* ===============================
   BREADCRUMB
================================ */
Widget _breadcrumb(BuildContext context, ProjectModel project) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: Responsive.isMobile(context) ? 20 : 80,
      vertical: 16,
    ),
    child: Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/projects'),
          child: Text(
            'Projects',
            style: TextStyle(
              fontSize: 13,
              color: Colors.blueAccent.withOpacity(0.9),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text('/', style: TextStyle(color: Colors.white.withOpacity(0.4))),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            project.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ),
      ],
    ),
  );
}

final List<ProjectModel> relatedProjects = [
  ProjectModel(
    title: 'Nayon Pilipino – Mobara',
    subtitle: 'Japan-Based E-Commerce',
    imagePath: 'assets/images/flutterflow/nayonlogo.jpg',
    role: 'Mobile Application Developer',
    overview: 'Cross-platform e-commerce app for the Japanese market.',
    tech: 'FlutterFlow • Firebase • Stripe',
    details: 'E-commerce, payments, and cloud backend.',
    screenshots: [],
  ),
  ProjectModel(
    title: 'Nutrien',
    subtitle: 'Enterprise ServiceNow Platform',
    imagePath: 'assets/images/snowlogo.png',
    role: 'ServiceNow Consultant',
    overview: 'Enterprise employee service portals.',
    tech: 'ServiceNow • Flow Designer • UI Builder',
    details: 'Automation and workflow optimization.',
    screenshots: [],
  ),
  ProjectModel(
    title: 'The Portal | Checkwriter',
    subtitle: 'Reactive Web Development',
    imagePath: 'assets/images/oslogo.jpg',
    role: 'OutSystems Developer',
    overview: 'Enterprise Banking Application',
    tech: 'OutSystems • REST|SOAP - APIs • UI|UX',
    details: 'Web Development',
    screenshots: [],
  ),
];

class _RelatedProjectCard extends StatelessWidget {
  final ProjectModel project;

  const _RelatedProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/project-detail', arguments: project);
      },
      child: Container(
        width: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white.withOpacity(0.04),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              child: Image.asset(
                project.imagePath,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    project.subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withOpacity(0.6),
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

class _RelatedProjects extends StatelessWidget {
  final ProjectModel current;

  const _RelatedProjects({required this.current});

  @override
  Widget build(BuildContext context) {
    final projects = relatedProjects
        .where((p) => p.title != current.title)
        .toList();

    if (projects.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RELATED PROJECTS',
            style: TextStyle(
              fontSize: 13,
              letterSpacing: 1.2,
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24),

          SizedBox(
            height: 260,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: projects.length,
              separatorBuilder: (_, __) => const SizedBox(width: 24),
              itemBuilder: (context, index) {
                final project = projects[index];
                return _RelatedProjectCard(project: project);
              },
            ),
          ),
        ],
      ),
    );
  }
}
