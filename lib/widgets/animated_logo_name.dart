import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedLogoName extends StatefulWidget {
  final String text;

  const AnimatedLogoName({
    super.key,
    required this.text,
  });

  @override
  State<AnimatedLogoName> createState() => _AnimatedLogoNameState();
}

class _AnimatedLogoNameState extends State<AnimatedLogoName>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offset;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );

    _offset = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0, end: 1.5),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.5, end: -1.5),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: -1.5, end: 0),
        weight: 1,
      ),
    ]).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _scheduleRandomPulse();
  }

  void _scheduleRandomPulse() {
    final random = Random();

    _timer = Timer(
      Duration(seconds: 6 + random.nextInt(4)), // 6–10 seconds
      () async {
        if (!mounted) return;
        await _controller.forward();
        _controller.reset();
        _scheduleRandomPulse();
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offset,
      builder: (_, _) {
        return Transform.translate(
          offset: Offset(_offset.value, 0),
          child: Text(
            widget.text,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
              color: Colors.blueAccent,
              shadows: [
                Shadow(
                  color: Colors.blueAccent.withOpacity(
                    _controller.isAnimating ? 0.6 : 0.25,
                  ),
                  blurRadius: _controller.isAnimating ? 12 : 6,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
