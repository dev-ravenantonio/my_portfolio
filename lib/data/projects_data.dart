import '../models/project_model.dart';

final List<ProjectModel> projects = [
  ProjectModel(
    slug: 'nayon-pilipino-mobara',
    title: 'Nayon Pilipino – Mobara',
    subtitle: 'Japan-based E-Commerce App',
    imagePath: 'assets/images/nayonlogo.jpg',
    role: 'FlutterFlow Mobile Developer',
    overview:
        'A production-grade cross-platform e-commerce application tailored '
        'for Japanese workflows.',
    tech:
        'FlutterFlow • Flutter • Firebase (Firestore) • Cloud Functions • '
        'Stripe API + Webhooks • GitHub • Play Store & App Store Deployment',
    details:
        'Developed and maintained the full e-commerce lifecycle including '
        'product catalog, cart logic, checkout, order management, and user authentication. '
        'Integrated Stripe API with webhook verification using Firebase Cloud Functions. '
        'Managed version control via GitHub and handled full iOS and Android store deployment. '
        'Ensured scalable Firestore data structure and secure payment flow.',
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

  ProjectModel(
    slug: 'outsystems-enterprise-apps',
    title: 'OutSystems Enterprise Apps',
    subtitle: 'Low-Code Cloud Solutions',
    imagePath: 'assets/images/oslogo.jpg',
    role: 'OutSystems Developer',
    overview:
        'Enterprise-grade web and mobile applications for financial institutions.',
    tech:
        'OutSystems 11 • OutSystems Developer Cloud • REST APIs • Integration Patterns',
    details:
        'Developed Merchant and Portal applications from scratch using '
        'OutSystems low-code platform. Implemented transaction handling, OTP verification, '
        'email notifications, and backend integrations. Designed secure integration patterns '
        'for REST and SOAP APIs. Optimized application performance and ensured production readiness.',
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

  ProjectModel(
    slug: 'flutter-advanced-training',
    title: 'Flutter Advanced Training & Deployments',
    subtitle: 'Technical Consultant Training Phase',
    imagePath: 'assets/images/flutterlogo.jpeg',
    role: 'Flutter Developer Trainee → Consultant',
    overview:
        'Intensive 6-month advanced Flutter development training and production deployments.',
    tech: 'Flutter • Dart • Firebase • REST APIs • State Management',
    details:
        'Progressed from Flutter fundamentals to advanced architectural patterns. '
        'Deployed multiple real-world applications including payroll and inventory systems. '
        'Handled client communication, feature refinement, debugging, and performance optimization.',
    screenshots: [
      'assets/images/flutter/chatify.png',
      'assets/images/flutter/Ecommerce.png',
      'assets/images/flutter/ocr.png',
    ],
    techDecisions: [],
  ),

  ProjectModel(
    slug: 'nutrien-servicenow-platform',
    title: 'Nutrien – ServiceNow Platform',
    subtitle: 'Enterprise Service Management',
    imagePath: 'assets/images/snowlogo.png',
    role: 'ServiceNow Consultant (Deloitte)',
    overview: 'Enterprise employee portal and workflow automation platform.',
    tech:
        'ServiceNow Next Experience • UI Builder • Flow Designer • JavaScript',
    details:
        'Built and enhanced employee service portals for Canadian and Australian accounts. '
        'Developed user stories, implemented automation via Flows and Sub-Flows, '
        'customized UI components, and ensured quality delivery across international teams.',
    screenshots: [
      'assets/images/servicenow/nutrien.png',
      'assets/images/servicenow/nutrien2.jpg',
      'assets/images/servicenow/nutrien3.jpg',
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
];
