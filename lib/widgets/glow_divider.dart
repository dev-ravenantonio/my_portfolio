import 'package:flutter/material.dart';

class GlowDivider extends StatefulWidget {
  const GlowDivider({super.key});

  @override
  State<GlowDivider> createState() => _GlowDividerState();
}

class _GlowDividerState extends State<GlowDivider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _opacity = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: Center(
        child: Container(
          width: 420,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.blueAccent.withOpacity(0.4),
                Colors.blueAccent,
                Colors.blueAccent.withOpacity(0.4),
                Colors.transparent,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.6),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
