import 'package:flutter/material.dart';
import '../models/projects_preview_card.dart';
import '../utils/responsive.dart';
import '../widgets/app_page_wrapper.dart';
import '../widgets/footer.dart';
import '../widgets/navbar.dart';
import '../data/projects_data.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
Widget build(BuildContext context) {
  return AppPageWrapper(
    child: SingleChildScrollView(
      child: Column(
        children: [
          const Navbar(),

          // Top spacing aligned with Home hero
          const SizedBox(height: 140),

          /// =========================
          /// SECTION HEADER
          /// =========================
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 1200,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'PROJECTS',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        letterSpacing: 2,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Selected Work',
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: 600,
                      child: Text(
                        'A collection of apps, systems, and automation solutions I’ve built using FlutterFlow, Firebase, and modern cloud tools.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          /// Divider
          Container(
            width: 1200,
            height: 1,
            color: Colors.white10,
          ),

          const SizedBox(height: 60),

          /// =========================
          /// PROJECTS GRID
          /// =========================
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 1200,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: projects.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        Responsive.isDesktop(context) ? 2 : 1,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                    childAspectRatio:
                        Responsive.isDesktop(context) ? 1.8 : 0.9,
                  ),
                  itemBuilder: (context, index) {
                    return ProjectPreviewCard(
                      project: projects[index],
                    );
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 120),
          const Footer(),
        ],
      ),
    ),
  );
}
}
