import 'package:flutter/material.dart';

class BackToTopButton extends StatefulWidget {
  final ScrollController controller;

  const BackToTopButton({super.key, required this.controller});

  @override
  State<BackToTopButton> createState() => _BackToTopButtonState();
}

class _BackToTopButtonState extends State<BackToTopButton> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      final shouldShow = widget.controller.offset > 600;
      if (shouldShow != _visible) {
        setState(() => _visible = shouldShow);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: _visible ? 1 : 0,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 300),
        scale: _visible ? 1 : 0.9,
        child: FloatingActionButton(
          backgroundColor: Colors.blueAccent.withOpacity(0.9),
          onPressed: () {
            widget.controller.animateTo(
              0,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOutCubic,
            );
          },
          child: const Icon(Icons.keyboard_arrow_up),
        ),
      ),
    );
  }
}
