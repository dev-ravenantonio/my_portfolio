import 'package:flutter/material.dart';

class SimpleFooter extends StatelessWidget {
  const SimpleFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 100,
        bottom: 40,
      ),
      child: Column(
        children: [
          Divider(
            color: Colors.white.withOpacity(0.08),
            thickness: 1,
            indent: 80,
            endIndent: 80,
          ),
          const SizedBox(height: 28),

          Text(
            'Raven Antonio',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'FlutterFlow Developer • AI Workflow Automation',
            style: TextStyle(
              fontSize: 13,
              color: Colors.white.withOpacity(0.55),
            ),
          ),

          const SizedBox(height: 16),

          Text(
            '© ${DateTime.now().year}',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.35),
            ),
          ),
        ],
      ),
    );
  }
}
