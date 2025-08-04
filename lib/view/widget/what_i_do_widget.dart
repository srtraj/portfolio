import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../generated/assets.dart';
import 'about_me_section.dart';
import 'glass_morphic_card.dart';

class WhatIDoWidget extends StatelessWidget {
  const WhatIDoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isTabletOrMobile = ResponsiveBreakpoints.of(
      context,
    ).smallerOrEqualTo(TABLET);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('What I Do', style: textTheme.bodyLarge),
        const Gap(20),
        const WhatIDoDescription(),
        const Gap(30),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                HighlightCard(
                  emoji: '📱',
                  title: 'Mobile App Development',
                  description:
                      'I build sleek, high-performance mobile apps tailored to Android & iOS using modern tools and best practices.',
                ),
                HighlightCard(
                  emoji: '🌐',
                  title: 'Cross-Platform Solutions',
                  description:
                      'Deliver apps that run seamlessly across Android, iOS, Web, Windows & Linux using shared codebases.',
                ),
                HighlightCard(
                  emoji: '⚙️',
                  title: 'Native Integrations',
                  description:
                      'Bridge mobile-native APIs, integrate C/C++ libraries, and connect with devices via Bluetooth, USB, or Wi-Fi.\n',
                ),
                HighlightCard(
                  emoji: '🚀',
                  title: 'Performance Optimization',
                  description:
                      'Improve load times, memory usage, and smoothness with advanced performance profiling and optimization.',
                ),
                HighlightCard(
                  emoji: '🔧',
                  title: 'Custom Architectures',
                  description:
                      'Design and implement scalable, modular architectures like MVVM, BLoC, and Clean Architecture for long-term growth.',
                ),
                HighlightCard(
                  emoji: '🔐',
                  title: 'Backend Integration',
                  description:
                      'Integrate apps with REST APIs, FastAPI services, Firebase, and real-time protocols like MQTT for robust experiences.',
                ),
                HighlightCard(
                  emoji: '🤖',
                  title: 'CI/CD & Automation',
                  description:
                      'Automate builds, testing, and deployments using GitHub Actions and GitLab CI for faster delivery cycles.',
                ),
              ],
            ),
          ),
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

class WhatIDoDescription extends StatelessWidget {
  const WhatIDoDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text.rich(
      TextSpan(
        style: GoogleFonts.notoSans(textStyle: textTheme.bodyMedium),
        children: const [
          TextSpan(
            text:
                'I help startups, enterprises, and entrepreneurs bring their digital ideas to life through ',
          ),
          TextSpan(
            text: 'robust, scalable, and visually polished applications',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                '. From full-cycle product development to backend integration and deployment, I offer solutions tailored to your business needs.\n\n',
          ),
          TextSpan(text: 'My work spans across platforms including '),
          TextSpan(
            text: 'Android, iOS, Web, Windows, and Linux',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          TextSpan(
            text:
                ', with deep expertise in cross-platform technologies and native integrations.',
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    );
  }
}
