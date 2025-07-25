import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portpolio/view/widget/home_section.dart';
import 'package:portpolio/view/widget/social_link_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final homeKey = GlobalKey();
  final projectKey = GlobalKey();
  final aboutKey = GlobalKey();

  late AnimationController _controller;
  late Animation<double> _fadeIn;

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface.withAlpha(230),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
              'Portfolio',
              style: GoogleFonts.dancingScript(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => _scrollTo(homeKey),
                child: const Text("Home"),
              ),
              TextButton(
                onPressed: () => _scrollTo(projectKey),
                child: const Text("Projects"),
              ),
              TextButton(
                onPressed: () => _scrollTo(aboutKey),
                child: const Text("About"),
              ),
              const Gap(50),
            ],
          ),
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _fadeIn,
              child: HomeSection(homeKey: homeKey),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeTransition(opacity: _fadeIn, child: const SocialLinks()),
          ),
        ],
      ),
    );
  }
}
