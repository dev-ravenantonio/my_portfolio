import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/navbar.dart';
import '../utils/responsive.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();

  bool _hoveringSubmit = false;

  Future<void> _sendEmail() async {
    final subject = Uri.encodeComponent('Portfolio Inquiry from ${_name.text}');
    final body = Uri.encodeComponent(
      'Name: ${_name.text}\n'
      'Email: ${_email.text}\n\n'
      'Project Details:\n${_message.text}',
    );

    final emailUri = Uri.parse(
      'mailto:dev.ravenantonio@gmail.com?subject=$subject&body=$body',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: Stack(
        children: [
          /// ===============================
          /// SAFE BACKGROUND GLOWS (lighter for CanvasKit)
          /// ===============================
          Positioned(
            top: 200,
            left: -180,
            child: _glowBeam(
              size: 380,
              color: Colors.blueAccent.withOpacity(0.14),
            ),
          ),
          Positioned(
            bottom: 140,
            right: -180,
            child: _glowBeam(
              size: 340,
              color: Colors.purpleAccent.withOpacity(0.10),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                const Navbar(),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 20 : 60,
                    vertical: isMobile ? 80 : 120,
                  ),
                  child: Column(
                    children: [
                      /// ===============================
                      /// HEADER
                      /// ===============================
                      const Text(
                        'Let’s Work Together',
                        style: TextStyle(
                          fontSize: 46,
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'Tell me about your project and I’ll personally get back to you.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.6,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),

                      const SizedBox(height: 56),

                      /// ===============================
                      /// FORM CARD (FIXED BORDER ISSUE)
                      /// ===============================
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 620),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(22),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                child: Container(
                                  padding: const EdgeInsets.all(30),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.38),
                                    borderRadius: BorderRadius.circular(22),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.08),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 30,
                                        color: Colors.blueAccent.withOpacity(
                                          0.18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        _inputField(
                                          controller: _name,
                                          label: 'Your Name',
                                          validator: (v) =>
                                              v!.isEmpty ? 'Required' : null,
                                        ),
                                        const SizedBox(height: 18),
                                        _inputField(
                                          controller: _email,
                                          label: 'Email Address',
                                          validator: (v) => v!.contains('@')
                                              ? null
                                              : 'Invalid email',
                                        ),
                                        const SizedBox(height: 18),
                                        _inputField(
                                          controller: _message,
                                          label: 'Project Details',
                                          maxLines: 5,
                                          validator: (v) => v!.length < 10
                                              ? 'Please add more details'
                                              : null,
                                        ),
                                        const SizedBox(height: 30),

                                        /// SUBMIT BUTTON
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          onEnter: (_) => setState(
                                            () => _hoveringSubmit = true,
                                          ),
                                          onExit: (_) => setState(
                                            () => _hoveringSubmit = false,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _sendEmail();
                                              }
                                            },
                                            child: AnimatedScale(
                                              scale: _hoveringSubmit
                                                  ? 1.04
                                                  : 1.0,
                                              duration: const Duration(
                                                milliseconds: 180,
                                              ),
                                              child: AnimatedContainer(
                                                duration: const Duration(
                                                  milliseconds: 200,
                                                ),
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 16,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: Colors.blueAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  boxShadow: _hoveringSubmit
                                                      ? [
                                                          BoxShadow(
                                                            blurRadius: 22,
                                                            color: Colors
                                                                .blueAccent
                                                                .withOpacity(
                                                                  0.5,
                                                                ),
                                                          ),
                                                        ]
                                                      : [],
                                                ),
                                                child: const Text(
                                                  'Send Message',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            /// SAFE TOP ACCENT LINE
                            Positioned(
                              top: 0,
                              left: 24,
                              right: 24,
                              child: Container(
                                height: 1,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.blueAccent.withOpacity(0.6),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 56),

                      /// ===============================
                      /// SOCIAL CONTACT OPTIONS
                      /// ===============================
                      Column(
                        children: [
                          Text(
                            'Or reach me directly',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                          const SizedBox(height: 18),
                          Wrap(
                            spacing: 16,
                            children: [
                              _socialButton(
                                label: 'LinkedIn',
                                svgPath: 'assets/icons/linkedin.svg',
                                accent: const Color(0xFF0A66C2),
                                url:
                                    'https://www.linkedin.com/in/raven-antonio/',
                              ),
                              _socialButton(
                                label: 'Upwork',
                                svgPath: 'assets/icons/upwork.svg',
                                accent: const Color(0xFF14A800),
                                url:
                                    'https://www.upwork.com/freelancers/~01da65a074342438d0',
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Text(
                            'No spam. I usually respond within 24–48 hours.',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white.withOpacity(0.45),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// INPUT FIELD
  Widget _inputField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFF020617),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.blueAccent),
        ),
      ),
    );
  }

  Widget _socialButton({
    required String label,
    required String url,
    required String svgPath,
    required Color accent,
  }) {
    return _HoverSocialButton(
      label: label,
      url: url,
      svgPath: svgPath,
      accent: accent,
    );
  }

  Widget _glowBeam({required double size, required Color color}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [color, Colors.transparent]),
      ),
    );
  }
}

class _HoverSocialButton extends StatefulWidget {
  final String label;
  final String url;
  final String svgPath;
  final Color accent;

  const _HoverSocialButton({
    required this.label,
    required this.url,
    required this.svgPath,
    required this.accent,
  });

  @override
  State<_HoverSocialButton> createState() => _HoverSocialButtonState();
}

class _HoverSocialButtonState extends State<_HoverSocialButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: AnimatedScale(
          scale: _hovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: widget.accent.withOpacity(_hovered ? 0.9 : 0.5),
              ),
              gradient: LinearGradient(
                colors: [
                  widget.accent.withOpacity(_hovered ? 0.35 : 0.18),
                  Colors.transparent,
                ],
              ),
              boxShadow: _hovered
                  ? [
                      BoxShadow(
                        blurRadius: 22,
                        color: widget.accent.withOpacity(0.45),
                      ),
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
                  colorFilter: ColorFilter.mode(widget.accent, BlendMode.srcIn),
                ),
                const SizedBox(width: 10),
                Text(
                  widget.label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.95),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
