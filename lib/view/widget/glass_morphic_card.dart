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
    this.expanded,
    this.title,
    this.trailingImage,
  });

  @override
  State<GlassmorphicCard> createState() => _GlassmorphicCardState();
}

class _GlassmorphicCardState extends State<GlassmorphicCard>
    with TickerProviderStateMixin {
  bool isHover = false;
  bool isExpanded = false;
  late double _defaultImageSize;
  late double imageSize;

  void _onHover(bool hover) {
    setState(() {
      isExpanded = false;
      isHover = hover;
      imageSize = hover ? _defaultImageSize + 10 : _defaultImageSize;
    });
    log(hover ? 'Hover Entered' : 'Hover Exited');
  }

  Widget? _buildAnimatedSvg(String? assetPath) {
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
    _defaultImageSize = isMobile ? 30.0 : 40.0;
    imageSize = _defaultImageSize;
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
                ? const EdgeInsets.all(10.0)
                : const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(
                color: Theme.of(context).colorScheme.inverseSurface.withValues(alpha: 0.5), // fixed invalid alpha
                width: 1.5,
              ),
            ),
            child: InkWell(
              onTap: () => setState(() {
                isExpanded = !isExpanded;
              }),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ?_buildAnimatedSvg(widget.leadingImage),
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

                    ?_buildAnimatedSvg(widget.trailingImage),
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
