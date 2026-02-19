import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CertItem extends StatefulWidget {
  final String iconPath;
  final String label;
  final String url; // Google Drive link

  const CertItem({super.key, 
    required this.iconPath,
    required this.label,
    required this.url,
  });

  @override
  State<CertItem> createState() => _CertItemState();
}

class _CertItemState extends State<CertItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {
          // Open Google Drive link (Flutter Web safe)
          // ignore: deprecated_member_use
          launchUrl(Uri.parse(widget.url));
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          width: 260,
          height: 170,
          transform: Matrix4.identity()
            ..translate(0.0, _hovered ? -4 : 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.white.withOpacity(0.05),
            border: Border.all(
              color: _hovered
                  ? Colors.blueAccent.withOpacity(0.4)
                  : Colors.white.withOpacity(0.08),
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.25),
                      blurRadius: 28,
                      offset: const Offset(0, 14),
                    ),
                  ]
                : [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// LOGO (BIGGER & READABLE)
              Container(
                height: 64,
                width: 64,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white.withOpacity(0.08),
                ),
                child: Image.asset(
                  widget.iconPath,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 16),

              /// LABEL
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    height: 1.35,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              /// MICRO CTA
              Text(
                'View certificate',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.blueAccent.withOpacity(
                    _hovered ? 1 : 0.7,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
