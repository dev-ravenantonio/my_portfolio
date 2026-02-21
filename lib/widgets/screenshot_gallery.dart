import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenshotGallery extends StatelessWidget {
  final List<String> images;

  const ScreenshotGallery({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return Text(
        'No screenshots available.',
        style: TextStyle(color: Colors.white.withOpacity(0.5)),
      );
    }

    return GridView.builder(
      itemCount: images.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return _ScreenshotTile(imagePath: images[index]);
      },
    );
  }
}

class _ScreenshotTile extends StatefulWidget {
  final String imagePath;

  const _ScreenshotTile({required this.imagePath});

  @override
  State<_ScreenshotTile> createState() => _ScreenshotTileState();
}

class _ScreenshotTileState extends State<_ScreenshotTile> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => _openFullscreen(context),
        child: AnimatedScale(
          scale: _hovered ? 1.04 : 1.0,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Stack(
              children: [
                Positioned.fill(
                  child: AdaptiveImage(
                    path: widget.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),

                // Subtle overlay on hover
                AnimatedOpacity(
                  opacity: _hovered ? 1 : 0,
                  duration: const Duration(milliseconds: 180),
                  child: Container(
                    color: Colors.black.withOpacity(0.25),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.zoom_in,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openFullscreen(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.85),
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              InteractiveViewer(
                minScale: 0.8,
                maxScale: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AdaptiveImage(
                    path: widget.imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Close button
              Positioned(
                top: 12,
                right: 12,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AdaptiveImage extends StatelessWidget {
  final String path;
  final BoxFit fit;

  const AdaptiveImage({super.key, required this.path, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    if (path.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(path, fit: fit);
    }

    return Image.asset(path, fit: fit);
  }
}
