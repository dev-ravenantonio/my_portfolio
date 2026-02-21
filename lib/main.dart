import 'package:flutter/material.dart';
import 'data/projects_data.dart';
import 'models/project_model.dart';
import 'pages/project_detail_page.dart';
import 'pages/home_page.dart';
import 'pages/services_page.dart';
import 'pages/projects_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'utils/page_transition.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raven Antonio | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        primaryColor: Colors.blueAccent,
      ),

      // 🔥 GLOBAL PAGE TRANSITIONS
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name ?? '/');

        // HOME
        if (uri.path == '/' || uri.path.isEmpty) {
          return FadeSlidePageRoute(page: HomePage(), settings: settings);
        }

        // STATIC ROUTES
        switch (uri.path) {
          case '/services':
            return FadeSlidePageRoute(
              page: const ServicesPage(),
              settings: settings,
            );

          case '/projects':
            return FadeSlidePageRoute(
              page: const ProjectsPage(),
              settings: settings,
            );

          case '/about':
            return FadeSlidePageRoute(
              page: const AboutPage(),
              settings: settings,
            );

          case '/contact':
            return FadeSlidePageRoute(
              page: const ContactPage(),
              settings: settings,
            );
        }
        
        // 🔁 REDIRECT /project → /projects
        if (uri.path == '/project') {
          return FadeSlidePageRoute(
            page: const ProjectsPage(),
            settings: settings,
          );
        }

        // 🔥 DYNAMIC PROJECT ROUTE
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'project') {
          final slug = uri.pathSegments[1];

          ProjectModel? project;

          try {
            project = projects.firstWhere((p) => p.slug == slug);
          } catch (_) {
            project = null;
          }

          return FadeSlidePageRoute(
            page: ProjectDetailPage(project: project),
            settings: settings,
          );
        }

        // 404 fallback
        return FadeSlidePageRoute(
          page: const Scaffold(body: Center(child: Text('Page not found'))),
          settings: settings,
        );
      },
    );
  }
}
