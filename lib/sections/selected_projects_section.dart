import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../widgets/project_card.dart';
import '../utils/responsive.dart';

class SelectedProjectsSection extends StatelessWidget {
  const SelectedProjectsSection({super.key});

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
          // Title
          const Text(
            'Selected Projects & Case Studies',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          Text(
            'A selection of production-ready applications and enterprise systems '
            'I’ve worked on across e-commerce, automation, and platform development.',
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.white.withOpacity(0.65),
            ),
          ),

          const SizedBox(height: 64),

          // Grid
          GridView.count(
            crossAxisCount: isMobile ? 1 : 3,
            mainAxisSpacing: 32,
            crossAxisSpacing: 32,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ProjectCard(
                category: 'Japan-Based E-Commerce Application',
                title: 'Nayon Pilipino – Mobara',
                role: 'Mobile Application Developer',
                description:
                    'A cross-platform e-commerce mobile app featuring product catalog, '
                    'cart and checkout, order management, and secure online payments. '
                    'Built to support real Japanese e-commerce workflows.',
                tech: 'FlutterFlow • Firebase • Stripe',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/project-detail',
                    arguments: ProjectModel(
                      title: 'Nayon Pilipino – Mobara',
                      subtitle: 'Japan-Based E-Commerce Application',
                      imagePath: 'assets/images/flutterflow/nayonlogo.jpg',
                      role: 'Mobile Application Developer',
                      overview:
                          'A cross-platform e-commerce mobile application built for the Japanese market.',
                      tech: 'FlutterFlow • Firebase • Stripe',
                      details:
                          'Developed and maintained a production-ready e-commerce platform '
                          'featuring product catalog, cart, checkout, order management, and '
                          'secure Stripe payments. Managed Firestore data modeling, Cloud '
                          'Functions, and CI/CD deployments for iOS and Google Play.',
                      screenshots: [
                        'assets/images/flutterflow/Storyboard.png',
                        'assets/images/flutterflow/firebase.png',
                        'assets/images/flutterflow/stripe.png',
                      ],
                    ),
                  );
                },
              ),

              ProjectCard(
                category: 'Enterprise ServiceNow Platform',
                title: 'Nutrien',
                role: 'ServiceNow Consultant',
                description:
                    'Enterprise employee service portals and workflow automation for '
                    'international clients across Canada and Australia, focusing on '
                    'efficiency, scalability, and reliability.',
                tech: 'ServiceNow • Flow Designer • UI Builder',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/project-detail',
                    arguments: ProjectModel(
                      title: 'Nutrien',
                      subtitle: 'Enterprise ServiceNow Platform',
                      imagePath: 'assets/images/snowlogo.png',
                      role: 'ServiceNow Consultant',
                      overview:
                          'Enterprise service portals and workflow automation.',
                      tech: 'ServiceNow • Flow Designer • UI Builder',
                      details: 'Worked on international enterprise projects.',
                      screenshots: [
                        'assets/images/servicenow/snowlogo.png',
                        'assets/images/servicenow/snowlogo.png',
                        'assets/images/servicenow/snowlogo.png',
                      ],
                    ),
                  );
                },
              ),

              ProjectCard(
                category: 'Payments & Platform Solutions',
                title: 'Enterprise & Financial Applications',
                role: 'Technical Consultant / Developer',
                description:
                    'Payment systems, enterprise dashboards, and internal platforms '
                    'supporting secure transactions, backend integrations, and API-driven '
                    'workflows.',
                tech: 'OutSystems • APIs • Payments',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/project-detail',
                    arguments: ProjectModel(
                      title: 'Nayon Pilipino – Mobara',
                      subtitle: 'Japan-Based E-Commerce Application',
                      imagePath: 'assets/images/outsystems/oslogo.jpg',
                      role: 'Mobile Application Developer',
                      overview:
                          'A cross-platform e-commerce mobile application built for the Japanese market.',
                      tech: 'FlutterFlow • Firebase • Stripe',
                      details:
                          'Developed and maintained a production-ready e-commerce platform '
                          'featuring product catalog, cart, checkout, order management, and '
                          'secure Stripe payments. Managed Firestore data modeling, Cloud '
                          'Functions, and CI/CD deployments for iOS and Google Play.',
                      screenshots: [
                        'assets/images/outsystems/oslogo.jpg',
                        'assets/images/outsystems/oslogo.jpg',
                        'assets/images/outsystems/oslogo.jpg',
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
