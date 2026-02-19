import 'package:flutter/material.dart';

class CtaPrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const CtaPrimaryButton({
    required this.label,
    required this.onPressed,
  });

  @override
  State<CtaPrimaryButton> createState() => CtaPrimaryButtonState();
}

class CtaPrimaryButtonState extends State<CtaPrimaryButton> {
  bool _hovered = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) {
          setState(() => _pressed = false);
          widget.onPressed();
        },
        onTapCancel: () => setState(() => _pressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 16,
          ),
          transform: Matrix4.identity()
            ..translate(0.0, _pressed ? 2.0 : 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF4F8CFF),
                Color(0xFF3B6FFF),
              ],
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: const Color(0xFF4F8CFF)
                          .withOpacity(0.45),
                      blurRadius: 26,
                      offset: const Offset(0, 12),
                    ),
                  ]
                : [],
          ),
          child: Text(
            widget.label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
