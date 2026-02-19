import 'package:flutter/material.dart';
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
        switch (settings.name) {
          case '/':
            return FadeSlidePageRoute(page: HomePage(), settings: settings);

          case '/services':
            return FadeSlidePageRoute(page: const ServicesPage(), settings: settings);

          case '/projects':
            return FadeSlidePageRoute(page: const ProjectsPage(), settings: settings);

          case '/about':
            return FadeSlidePageRoute(page: const AboutPage(), settings: settings);

          case '/contact':
            return FadeSlidePageRoute(page: const ContactPage(), settings: settings);

          case '/project-detail':
            return FadeSlidePageRoute(
              page: const ProjectDetailPage(), settings: settings,
            );

          default:
            return FadeSlidePageRoute(page: HomePage(), settings: settings);
        }
      },
    );
  }
}
