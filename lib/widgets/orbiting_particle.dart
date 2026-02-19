import 'dart:math';
import 'package:flutter/material.dart';

class OrbitingParticle extends StatefulWidget {
  final double radius;
  final double size;
  final Duration duration;
  final Color color;

  const OrbitingParticle({
    super.key,
    required this.radius,
    this.size = 6,
    this.duration = const Duration(seconds: 6),
    this.color = Colors.blueAccent,
  });

  @override
  State<OrbitingParticle> createState() => _OrbitingParticleState();
}

class _OrbitingParticleState extends State<OrbitingParticle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, _) {
        final angle = _controller.value * 2 * pi;
        final x = cos(angle) * widget.radius;
        final y = sin(angle) * widget.radius;

        return Transform.translate(
          offset: Offset(x, y),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color.withOpacity(0.9),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withOpacity(0.8),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
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
