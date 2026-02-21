import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../widgets/project_card.dart';
import '../utils/responsive.dart';

class SelectedProjectsSection extends StatelessWidget {
  const SelectedProjectsSection({super.key, this.project});
  final ProjectModel? project;

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
                    '/project/nayon-pilipino-mobara',
                    arguments: ProjectModel(
                      slug: 'nayon-pilipino-mobara',
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
                      techDecisions: [
                        TechDecision(
                          title: 'FlutterFlow',
                          description:
                              'Used for rapid iteration and maintainable cross-platform development '
                              'while retaining full control over logic and architecture.',
                        ),
                        TechDecision(
                          title: 'Firebase',
                          description:
                              'Chosen for its scalable, serverless backend, real-time data sync, '
                              'and seamless mobile integration.',
                        ),
                        TechDecision(
                          title: 'Stripe',
                          description:
                              'Implemented for secure, PCI-compliant payment processing with '
                              'webhook-based transaction validation.',
                        ),
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
                    '/project/nutrien-servicenow-platform',
                    arguments: ProjectModel(
                      slug: 'nutrien-servicenow-platform',
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
                      techDecisions: [
                        TechDecision(
                          title: 'ServiceNow',
                          description:
                              'Selected as the enterprise service management platform to standardize '
                              'employee workflows and internal service delivery.',
                        ),
                        TechDecision(
                          title: 'Flow Designer',
                          description:
                              'Used to automate approvals, service requests, and backend processes '
                              'to reduce manual intervention.',
                        ),
                        TechDecision(
                          title: 'UI Builder',
                          description:
                              'Enabled modern, responsive user interfaces aligned with ServiceNow '
                              'Next Experience standards.',
                        ),
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
                    '/project/outsystems-enterprise-apps',
                    arguments: ProjectModel(
                      slug: 'outsystems-enterprise-apps',
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
                        'assets/images/outsystems/checkwriter.svg',
                        'assets/images/outsystems/checkwriter2.svg',
                        'assets/images/outsystems/theportalmobile.jpg',
                      ],
                      techDecisions: [
                        TechDecision(
                          title: 'OutSystems',
                          description:
                              'Adopted for rapid low-code development while maintaining enterprise-grade '
                              'performance and scalability.',
                        ),
                        TechDecision(
                          title: 'REST & SOAP APIs',
                          description:
                              'Integrated multiple backend systems using secure API patterns to '
                              'support financial transactions and data exchange.',
                        ),
                        TechDecision(
                          title: 'Security Architecture',
                          description:
                              'Implemented role-based access control and validation layers suitable '
                              'for banking and financial environments.',
                        ),
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
