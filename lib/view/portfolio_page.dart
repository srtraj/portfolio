import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portpolio/view/widget/about_me_section.dart';
import 'package:portpolio/view/widget/custom_container.dart';
import 'package:portpolio/view/widget/education_section.dart';
import 'package:portpolio/view/widget/home_section.dart';
import 'package:portpolio/view/widget/social_link_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final homeKey = GlobalKey();
  final projectKey = GlobalKey();
  final aboutKey = GlobalKey();
  final educationKey = GlobalKey();

  late Timer _timer;
  int bgIndex = 0;

  final List<Color> _colorOptions = [
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.red,
    Colors.greenAccent,
    Colors.tealAccent,
    Colors.indigo,
    Colors.cyan,
    Colors.deepPurple,
    Colors.pink,
    Colors.deepOrange,
    Colors.amber,
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      setState(() {
        bgIndex = (bgIndex + 1) % _colorOptions.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

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

  List<Color> _getGradientColors() {
    final nextIndex = (bgIndex + 1) % _colorOptions.length;
    return [
      _colorOptions[bgIndex].withValues(alpha: 0.15),
      _colorOptions[nextIndex].withValues(alpha: 0.15),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface.withAlpha(230),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _getGradientColors(),
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Text(
                'Portfolio',
                style: GoogleFonts.dancingScript(
                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  color: Colors.white,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => _scrollTo(homeKey),
                  child: const Text("Home"),
                ),
                TextButton(
                  onPressed: () => _scrollTo(aboutKey),
                  child: const Text("About"),
                ),
                TextButton(
                  onPressed: () => _scrollTo(educationKey),
                  child: const Text("Education"),
                ),
                const Gap(50),
              ],
            ),
            CustomContainer(homeKey: homeKey, child: HomeSection()),
            CustomContainer(child: const SocialLinks()),
            CustomContainer(homeKey: aboutKey, child: const AboutMeSection()),
            CustomContainer(
              homeKey: educationKey,
              child: const EducationSection(),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
