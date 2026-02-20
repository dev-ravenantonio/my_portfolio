import 'package:flutter/material.dart';
import 'particles_background.dart';

class AppPageWrapper extends StatelessWidget {
  final Widget child;

  const AppPageWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AbstractBackground(),
          const ParticlesBackground(),

          // Page content
          child,
        ],
      ),
    );
  }
}

/// ===============================
/// ABSTRACT BACKGROUND (GLOBAL)
/// ===============================
class AbstractBackground extends StatelessWidget {
  const AbstractBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF020617),
            Color(0xFF020617),
            Color(0xFF020617),
          ],
        ),
      ),
      child: Stack(
        children: [
          _blurCircle(
            top: -140,
            left: -140,
            size: 320,
            color: Colors.blueAccent.withOpacity(0.12),
          ),
          _blurCircle(
            bottom: -160,
            right: -160,
            size: 360,
            color: Colors.purpleAccent.withOpacity(0.12),
          ),
        ],
      ),
    );
  }

  Widget _blurCircle({
    double? top,
    double? bottom,
    double? left,
    double? right,
    required double size,
    required Color color,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}