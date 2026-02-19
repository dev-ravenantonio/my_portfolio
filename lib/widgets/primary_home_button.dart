import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// ===============================
/// PRIMARY BUTTON (FILLED)
/// ===============================
class PrimaryHomeButton extends StatefulWidget {
  final String label;
  final String svgPath;
  final VoidCallback onPressed;

  const PrimaryHomeButton({
    super.key,
    required this.label,
    required this.svgPath,
    required this.onPressed,
  });

  @override
  State<PrimaryHomeButton> createState() =>
      PrimaryHomeButtonState();
}

class PrimaryHomeButtonState
    extends State<PrimaryHomeButton> {
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
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()
            ..scale(_pressed ? 0.96 : 1),
          padding: const EdgeInsets.symmetric(
              horizontal: 26, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
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
                      blurRadius: 24,
                      offset: const Offset(0, 10),
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                widget.svgPath,
                width: 18,
                height: 18,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ===============================
/// SECONDARY BUTTON (OUTLINE)
/// ===============================
class SecondaryHomeButton extends StatefulWidget {
  final String label;
  final String svgPath;
  final VoidCallback onPressed;

  const SecondaryHomeButton({
    super.key,
    required this.label,
    required this.svgPath,
    required this.onPressed,
  });

  @override
  State<SecondaryHomeButton> createState() =>
      _SecondaryHomeButtonState();
}

class _SecondaryHomeButtonState
    extends State<SecondaryHomeButton> {
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
              horizontal: 26, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: _hovered
                ? const Color(0xFF1E2A45)
                : Colors.transparent,
            border: Border.all(
              color: const Color(0xFF4F8CFF),
              width: 1.4,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                widget.svgPath,
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(
                  _hovered
                      ? Colors.white
                      : const Color(0xFF4F8CFF),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                widget.label,
                style: TextStyle(
                  color: _hovered
                      ? Colors.white
                      : const Color(0xFF4F8CFF),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
