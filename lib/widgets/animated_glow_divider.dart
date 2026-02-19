import 'package:flutter/material.dart';

class AnimatedGlowDivider extends StatefulWidget {
  const AnimatedGlowDivider({super.key});

  @override
  State<AnimatedGlowDivider> createState() => _AnimatedGlowDividerState();
}

class _AnimatedGlowDividerState extends State<AnimatedGlowDivider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Container(
          height: 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1 + _controller.value * 2, 0),
              end: Alignment(1 + _controller.value * 2, 0),
              colors: [
                Colors.transparent,
                Colors.blueAccent.withOpacity(0.6),
                Colors.transparent,
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
