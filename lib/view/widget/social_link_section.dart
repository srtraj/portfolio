import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(child: Divider(color: Colors.grey, thickness: 1)),
        const SizedBox(width: 16),
        Wrap(
          spacing: 12,
          children: [
            SocialButton(
              icon: Icons.email_outlined,
              label: "Email",
              uri: Uri(
                scheme: 'mailto',
                path: 'sharathmadhur@gmail.com',
                query: 'subject=Contact from Portfolio',
              ),
            ),
            SocialButton(
              icon: Icons.call,
              label: "Call",
              uri: Uri(scheme: 'tel', path: '+918157898849'),
            ),
            SocialButton(
              icon: FontAwesomeIcons.github,
              label: "GitHub",
              uri: Uri.parse('https://github.com/srtraj'),
            ),
            SocialButton(
              icon: FontAwesomeIcons.linkedinIn,
              label: "LinkedIn",
              uri: Uri.parse(
                'https://www.linkedin.com/in/sharathraj-a-b83690176/',
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        const Flexible(child: Divider(color: Colors.grey, thickness: 1)),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Uri uri;

  const SocialButton({
    super.key,
    required this.icon,
    required this.label,
    required this.uri,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> handleClick() async {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    }

    final isWide = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    return isWide
        ? ElevatedButton.icon(
            onPressed: handleClick,
            icon: FaIcon(icon, size: 16),
            label: Text(label, style: Theme.of(context).textTheme.labelMedium),
            style: ElevatedButton.styleFrom(
              // Use theme colors
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        : IconButton(
            onPressed: handleClick,
            icon: FaIcon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            tooltip: label,
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints.tightFor(width: 48, height: 48),
          );
  }
}
