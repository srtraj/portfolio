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
          SliverToBoxAdapter(
            child: SizedBox(height: 16), // space
          ),
        ],
      ),
    );
  }
}
