import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 50,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.06))),
      ),
      child: Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          // Name
          const Text(
            'Raven Antonio',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),

          Text(
            'FlutterFlow Developer • AI Workflow Automation Specialist',
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.6),
            ),
          ),

          const SizedBox(height: 24),

          // SOCIALS
          Row(
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: const [
              _SocialIcon(
                svgPath: 'assets/icons/linkedin.svg',
                label: 'LinkedIn',
                url: 'https://linkedin.com/in/raven-antonio/',
              ),
              SizedBox(width: 18),
              _SocialIcon(
                svgPath: 'assets/icons/github.svg',
                label: 'GitHub',
                url: 'https://github.com/',
              ),
            ],
          ),

          const SizedBox(height: 30),

          Divider(color: Colors.white.withOpacity(0.08)),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© ${DateTime.now().year} Raven Antonio',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.45),
                ),
              ),

              if (!isMobile)
                Row(
                  children: [
                    _FooterLink(label: 'Home', route: '/'),
                    _FooterLink(label: 'Projects', route: '/projects'),
                    _FooterLink(label: 'Contact', route: '/contact'),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final String route;

  const _FooterLink({required this.label, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, route),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final String svgPath; // 🔥 changed
  final String label;
  final String url;

  const _SocialIcon({
    required this.svgPath,
    required this.label,
    required this.url,
  });

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovered = false;

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchURL(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _hovered
                ? Colors.blueAccent.withOpacity(0.15)
                : Colors.white.withOpacity(0.05),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      blurRadius: 18,
                      color: Colors.blueAccent.withOpacity(0.35),
                    ),
                  ]
                : [],
          ),
          child: SvgPicture.asset(
            widget.svgPath,
            width: 18,
            height: 18,
            colorFilter: ColorFilter.mode(
              _hovered ? Colors.blueAccent : Colors.white.withOpacity(0.7),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
