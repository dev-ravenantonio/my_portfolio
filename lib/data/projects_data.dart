import '../models/project_model.dart';

final List<ProjectModel> projects = [
  ProjectModel(
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
  ),

  ProjectModel(
    title: 'OutSystems Enterprise Apps',
    subtitle: 'Low-Code Cloud Solutions',
    imagePath: 'assets/images/oslogo.jpg',
    role: 'OutSystems Developer',
    overview:
        'Enterprise-grade web and mobile applications for financial institutions.',
    tech:
        'OutSystems 11, OutSystems Developer Cloud, REST APIs, Integration Patterns',
    details:
        'Developed Merchant and Portal applications from scratch using '
        'OutSystems low-code platform. Implemented transaction handling, OTP verification, '
        'email notifications, and backend integrations. Designed secure integration patterns '
        'for REST and SOAP APIs. Optimized application performance and ensured production readiness.',
    screenshots: [
      'assets/images/outsystems/oslogo.jpg',
      'assets/images/outsystems/oslogo.jpg',
      'assets/images/outsystems/oslogo.jpg',
    ],
  ),

  ProjectModel(
    title: 'Flutter Advanced Training & Deployments',
    subtitle: 'Technical Consultant Training Phase',
    imagePath: 'assets/images/flutterlogo.jpeg',
    role: 'Flutter Developer Trainee → Consultant',
    overview:
        'Intensive 6-month advanced Flutter development training and production deployments.',
    tech: 'Flutter, Dart, Firebase, REST APIs, State Management',
    details:
        'Progressed from Flutter fundamentals to advanced architectural patterns. '
        'Deployed multiple real-world applications including payroll and inventory systems. '
        'Handled client communication, feature refinement, debugging, and performance optimization.',
    screenshots: [
      'assets/images/flutter/flutterlogo.jpeg',
      'assets/images/flutter/flutterlogo.jpeg',
      'assets/images/flutter/flutterlogo.jpeg',
    ],
  ),

  ProjectModel(
    title: 'Nutrien – ServiceNow Platform',
    subtitle: 'Enterprise Service Management',
    imagePath: 'assets/images/snowlogo.png',
    role: 'ServiceNow Consultant (Deloitte)',
    overview: 'Enterprise employee portal and workflow automation platform.',
    tech: 'ServiceNow Next Experience, UI Builder, Flow Designer, JavaScript',
    details:
        'Built and enhanced employee service portals for Canadian and Australian accounts. '
        'Developed user stories, implemented automation via Flows and Sub-Flows, '
        'customized UI components, and ensured quality delivery across international teams.',
    screenshots: [
      'assets/images/servicenow/snowlogo.png',
      'assets/images/servicenow/snowlogo.png',
      'assets/images/servicenow/snowlogo.png',
    ],
  ),
];
