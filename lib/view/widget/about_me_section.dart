import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portpolio/generated/assets.dart';
import 'package:portpolio/view/widget/glass_morphic_card.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isTabletOrMobile = ResponsiveBreakpoints.of(
      context,
    ).smallerOrEqualTo(TABLET);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About Me', style: textTheme.bodyLarge),
        const Gap(20),
        if (isTabletOrMobile)
          Column(
            spacing: 40,
            children: [SkillDescription(), SkillCard(isCompactMode: true)],
          )
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Expanded(child: SkillCard()),
              Expanded(child: SkillDescription()),
            ],
          ),
      ],
    );
  }
}

class SkillCard extends StatelessWidget {
  final bool isCompactMode;

  const SkillCard({super.key, this.isCompactMode = false});

  @override
  Widget build(BuildContext context) {
    final skills = [
      GlassmorphicCard(
        title: isCompactMode ? null : 'Flutter Development',
        trailingImage: Assets.assetsFlutter,
      ),
      GlassmorphicCard(
        title: isCompactMode ? null : 'Android Development',
        trailingImage: Assets.assetsAndroid,
      ),
      GlassmorphicCard(
        title: isCompactMode ? null : 'Compose Multiplatform',
        trailingImage: Assets.assetsCompose,
      ),
      GlassmorphicCard(
        title: isCompactMode ? null : 'FastAPI',
        trailingImage: Assets.assetsPython,
      ),
    ];
    if (isCompactMode) {
      return Row(mainAxisSize: MainAxisSize.min, spacing: 10, children: skills);
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: skills,
    );
  }
}

class SkillDescription extends StatelessWidget {
  const SkillDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text.rich(
      TextSpan(
        style: GoogleFonts.notoSans(textStyle: textTheme.labelLarge),
        children: [
          const TextSpan(text: 'Passionate '),
          TextSpan(
            text: 'Mobile App Developer',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const TextSpan(text: ' with over 5 years of experience in '),
          TextSpan(
            text: 'Flutter',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const TextSpan(text: ' and 2.5 years in '),
          TextSpan(
            text: 'Kotlin / Jetpack Compose',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
          const TextSpan(
            text:
                '. Skilled in building production-ready cross-platform and native Android applications.\n\n',
          ),
          const TextSpan(text: 'Experienced in '),
          TextSpan(
            text: 'performance optimization, native integration, ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const TextSpan(
            text:
                'and full-cycle app development. Delivered robust solutions in diverse sectors such as ',
          ),
          TextSpan(
            text: 'automotive',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          const TextSpan(text: ', '),
          TextSpan(
            text: 'fintech',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          const TextSpan(text: ', and '),
          TextSpan(
            text: 'IoT',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const TextSpan(text: '.'),
        ],
      ),
      textAlign: TextAlign.justify,
    );
  }
}
