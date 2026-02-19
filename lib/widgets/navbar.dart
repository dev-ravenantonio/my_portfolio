import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'animated_logo_name.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _isScrolled = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Listen to primary scroll controller (used in most web layouts)
    final controller = PrimaryScrollController.of(context);
    controller.addListener(() {
      final scrolled = controller.offset > 20;
      if (scrolled != _isScrolled) {
        setState(() => _isScrolled = scrolled);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
      decoration: BoxDecoration(
        color: _isScrolled
            ? Colors.black.withOpacity(0.65)
            : Colors.transparent,
        boxShadow: _isScrolled
            ? [
                BoxShadow(
                  blurRadius: 30,
                  color: Colors.black.withOpacity(0.35),
                )
              ]
            : [],
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: _isScrolled ? 12 : 0,
            sigmaY: _isScrolled ? 12 : 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AnimatedLogoName(text: 'Raven Antonio'),

              Row(
                children: const [
                  NavItem(title: 'Home', route: '/'),
                  NavItem(title: 'Services', route: '/services'),
                  NavItem(title: 'Projects', route: '/projects'),
                  NavItem(title: 'About', route: '/about'),
                  NavItem(title: 'Contact', route: '/contact', isCTA: true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ===============================
/// NAV ITEM
/// ===============================
class NavItem extends StatefulWidget {
  final String title;
  final String route;
  final bool isCTA;

  const NavItem({
    super.key,
    required this.title,
    required this.route,
    this.isCTA = false,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isActive =
        ModalRoute.of(context)?.settings.name == widget.route;

    if (widget.isCTA) {
      return Padding(
        padding: const EdgeInsets.only(left: 24),
        child: _CTAButton(
          title: widget.title,
          route: widget.route,
        ),
      );
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {
          if (!isActive) {
            Navigator.pushNamed(context, widget.route);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight:
                      isActive ? FontWeight.w600 : FontWeight.w500,
                  letterSpacing: 0.8,
                  color: isActive || _hovered
                      ? Colors.white
                      : Colors.white.withOpacity(0.65),
                ),
                child: Text(widget.title.toUpperCase()),
              ),
              const SizedBox(height: 6),

              /// Animated Underline (more intentional)
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                height: 2,
                width: isActive
                    ? 22
                    : _hovered
                        ? 14
                        : 0,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(2),
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
/// CTA BUTTON (Contact)
/// ===============================
class _CTAButton extends StatefulWidget {
  final String title;
  final String route;

  const _CTAButton({
    required this.title,
    required this.route,
  });

  @override
  State<_CTAButton> createState() => _CTAButtonState();
}

class _CTAButtonState extends State<_CTAButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, widget.route);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(30),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      blurRadius: 18,
                      color: Colors.blueAccent.withOpacity(0.5),
                    )
                  ]
                : [],
          ),
          child: Text(
            widget.title.toUpperCase(),
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
