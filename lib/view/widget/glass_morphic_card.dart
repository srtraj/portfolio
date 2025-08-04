import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

class GlassmorphicCard extends StatefulWidget {
  final double borderRadius;
  final double blur;
  final EdgeInsets? padding;
  final String? leadingImage;
  final String? title;
  final String? trailingImage;
  final Widget? expanded;

  const GlassmorphicCard({
    super.key,
    this.borderRadius = 14,
    this.blur = 10,
    this.padding,
    this.leadingImage,
    this.title,
    this.trailingImage,
    this.expanded,
  });

  @override
  State<GlassmorphicCard> createState() => _GlassmorphicCardState();
}

class _GlassmorphicCardState extends State<GlassmorphicCard>
    with TickerProviderStateMixin {
  bool isHover = false;
  bool isExpanded = false;

  void _onHover(bool hover) {
    setState(() {
      isExpanded = false;
      isHover = hover;
    });
    log(hover ? 'Hover Entered' : 'Hover Exited');
  }

  Widget? _buildAnimatedSvg(String? assetPath, double imageSize) {
    if (assetPath == null) return null;

    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      alignment: Alignment.center,
      child: SvgPicture.asset(
        assetPath,
        width: imageSize,
        height: imageSize,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    final imageSize = isMobile ? 30.0 : 40.0;

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: widget.blur, sigmaY: widget.blur),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: isHover
                ? const EdgeInsets.all(10)
                : const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inverseSurface.withAlpha(50),
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(
                color: Theme.of(
                  context,
                ).colorScheme.inverseSurface.withAlpha(128),
                width: (isHover || isExpanded) ? 2 : 1,
              ),
            ),
            child: InkWell(
              onTap: () => setState(() => isExpanded = !isExpanded),
              child: Padding(
                padding: widget.padding ?? const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.leadingImage != null)
                      _buildAnimatedSvg(widget.leadingImage, imageSize)!,
                    if (widget.title != null)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title!,
                                style: GoogleFonts.goldman(
                                  fontSize: Theme.of(
                                    context,
                                  ).textTheme.bodySmall?.fontSize,
                                ),
                              ),
                              if (isHover || isExpanded)
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: widget.expanded,
                                ),
                            ],
                          ),
                        ),
                      ),
                    if (widget.trailingImage != null)
                      _buildAnimatedSvg(widget.trailingImage, imageSize)!,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
