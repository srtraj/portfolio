import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CustomContainer extends StatefulWidget {
  final Widget child;
  final GlobalKey? homeKey;

  const CustomContainer({super.key, required this.child, this.homeKey});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer>
    with SingleTickerProviderStateMixin {
  late Animation<double> _fadeIn;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final screenWidth = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: FadeTransition(
        opacity: _fadeIn,
        child: Center(
          child: Container(
            key: widget.homeKey,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: isTablet ? 20.0 : 50,
            ),
            width: isTablet
                ? screenWidth >= 600
                      ? 600
                      : screenWidth
                : screenWidth >= 800
                ? 800
                : screenWidth,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
