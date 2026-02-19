import 'dart:math';
import 'package:flutter/material.dart';

class ParticlesBackground extends StatefulWidget {
  const ParticlesBackground({super.key});

  @override
  State<ParticlesBackground> createState() => _ParticlesBackgroundState();
}

class _ParticlesBackgroundState extends State<ParticlesBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final int particleCount = 20;
  final Random random = Random();

  late List<_Particle> particles;

  @override
  void initState() {
    super.initState();

    particles = List.generate(
      particleCount,
      (_) => _Particle.random(random),
    );

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, _) {
        return CustomPaint(
          painter: _ParticlesPainter(particles, _controller.value),
          size: Size.infinite,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _Particle {
  final double x;
  final double y;
  final double radius;
  final double speed;

  _Particle(this.x, this.y, this.radius, this.speed);

  factory _Particle.random(Random random) {
    return _Particle(
      random.nextDouble(),
      random.nextDouble(),
      random.nextDouble() * 2 + 1,
      random.nextDouble() * 0.02 + 0.005,
    );
  }
}

class _ParticlesPainter extends CustomPainter {
  final List<_Particle> particles;
  final double progress;

  _ParticlesPainter(this.particles, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blueAccent.withOpacity(0.15);

    for (var p in particles) {
      final dx = p.x * size.width;
      final dy = ((p.y + progress * p.speed) % 1.0) * size.height;
      canvas.drawCircle(Offset(dx, dy), p.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
