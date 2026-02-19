
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      SecondaryHomeButtonState();
}

class SecondaryHomeButtonState
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