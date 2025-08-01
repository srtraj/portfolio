import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../generated/assets.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    final textTheme = Theme.of(context).textTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.assetsBg),
          fit: BoxFit.fitHeight,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.05),
            BlendMode.dstIn,
          ),
        ),
      ),
      child: Row(
        spacing: 30,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(20),
                Text("Hi, I'm", style: textTheme.titleLarge),
                Gap(10),
                Text("Sharathraj A", style: textTheme.titleLarge),
                const SizedBox(
                  width: 100,
                  child: Divider(color: Color(0xFF1B88B6), thickness: 7),
                ),
                const Gap(20),
                if (isTablet) ...[
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        Assets.assetsProfile,
                        width: isMobile
                            ? MediaQuery.of(context).size.width - 75
                            : 400,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Gap(20),
                ],
                DefaultTextStyle(
                  style: textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 1000),
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Mobile Developer",
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: textTheme.bodySmall,
                    children: const [
                      TextSpan(text: "I build "),
                      TextSpan(
                        text: "smooth ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "and "),
                      TextSpan(
                        text: "reliable ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "apps using "),
                      TextSpan(
                        text: "Flutter 🐣",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(text: " and "),
                      TextSpan(
                        text: "Jetpack Compose ⚙️",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(text: ", with a focus on "),
                      TextSpan(
                        text: "performance 🚀",
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: " and "),
                      TextSpan(
                        text: "clean design 🎨",
                        style: TextStyle(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ". Bugs 🐛 don't stay long around my code.",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (!isTablet)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                Assets.assetsProfile,
                width: 360,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}
