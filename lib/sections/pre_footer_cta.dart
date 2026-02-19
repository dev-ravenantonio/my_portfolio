import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import '../widgets/premium_primary_button.dart';
import '../widgets/premium_secondary_button.dart';

class PreFooterCTA extends StatelessWidget {
  const PreFooterCTA({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 100,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 60,
          vertical: isMobile ? 36 : 48,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent.withOpacity(0.18),
              Colors.transparent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: Colors.blueAccent.withOpacity(0.25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Let’s build something impactful',
              style: TextStyle(
                fontSize: isMobile ? 26 : 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'If you’re looking for a developer who understands real-world '
              'business workflows, scalability, and clean architecture — '
              'let’s talk.',
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.white.withOpacity(0.75),
              ),
            ),
            const SizedBox(height: 32),

            Wrap(
  spacing: 16,
  runSpacing: 12,
  children: [
    CtaPrimaryButton(
      label: 'Start a Project',
      onPressed: () {
        Navigator.pushNamed(context, '/contact');
      },
    ),
    CtaSecondaryButton(
      label: 'View More Work',
      onPressed: () {
        Navigator.pushNamed(context, '/projects');
      },
    ),
  ],
),

          ],
        ),
      ),
    );
  }
}
