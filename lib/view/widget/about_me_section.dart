import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
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
        const AboutMeDescription(),
        const Gap(30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                HighlightCard(
                  emoji: '⚡',
                  title: 'Boosted App Speed',
                  description:
                      'Achieved 3× faster UI responsiveness across 10+ apps with smart rendering and state handling.',
                ),
                HighlightCard(
                  emoji: '🚀',
                  title: 'Faster Builds',
                  description:
                      'Cut build and release times by 45% with optimized pipelines and configs.',
                ),
                HighlightCard(
                  emoji: '🤖',
                  title: 'Smarter Workflows',
                  description:
                      'Automated CI/CD pipelines to boost team efficiency by 50% and reduce manual overhead.',
                ),
                HighlightCard(
                  emoji: '🏗️',
                  title: 'Scalable by Design',
                  description:
                      'Led modular architecture for 10+ apps, built for growth and easy maintenance.',
                ),
                HighlightCard(
                  emoji: '🧩️',
                  title: 'Multiplatform Application',
                  description:
                      'Built and deployed apps Android, iOS, Web, Windows, and Linux with consistent UX and shared codebase.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AboutMeDescription extends StatelessWidget {
  const AboutMeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text.rich(
      TextSpan(
        style: GoogleFonts.notoSans(textStyle: textTheme.bodyMedium),
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
              color: Color(0xFF4A148C),
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

class HighlightCard extends StatefulWidget {
  final String emoji;
  final String title;
  final String description;

  // final double? height;

  const HighlightCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.description,
    // this.height,
  });

  @override
  State<HighlightCard> createState() => _HighlightCardState();
}

class _HighlightCardState extends State<HighlightCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Container(
          width: 350,
          // height: widget.height,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: _isHovered ? 2 : 1,
              color: Theme.of(
                context,
              ).colorScheme.inverseSurface.withAlpha(_isHovered ? 200 : 100),
            ),
            color: Theme.of(
              context,
            ).colorScheme.inverseSurface.withAlpha(_isHovered ? 20 : 10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(widget.emoji, style: const TextStyle(fontSize: 28)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.description,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
