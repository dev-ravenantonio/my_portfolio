import 'package:flutter/material.dart';

class CtaSecondaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const CtaSecondaryButton({
    required this.label,
    required this.onPressed,
  });

  @override
  State<CtaSecondaryButton> createState() =>
      CtaSecondaryButtonState();
}

class CtaSecondaryButtonState extends State<CtaSecondaryButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: _hovered
                ? Colors.white.withOpacity(0.08)
                : Colors.transparent,
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.12),
                      blurRadius: 18,
                    ),
                  ]
                : [],
          ),
          child: Text(
            widget.label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}