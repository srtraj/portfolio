import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portpolio/generated/assets.dart';
import 'package:portpolio/view/widget/glass_morphic_card.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Education", style: textTheme.bodyLarge),
        Gap(20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            GlassmorphicCard(
              title: "HHSIBSHSS Edneer",
              leadingImage: Assets.assetsSchool,
              expanded: Column(
                children: [
                  LabelWidget(label: "Year", value: "2015"),
                  LabelWidget(label: "Percentage", value: "80%"),
                ],
              ),
            ),
            GlassmorphicCard(
              title: "VCET, Puttur",
              leadingImage: Assets.assetsGraduate,
              expanded: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bachelor of Engineering in Computer Science",
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  LabelWidget(label: "University", value: "VTU"),
                  LabelWidget(label: "Year", value: "2019"),
                  LabelWidget(label: "Percentage", value: "7.7 CGPA"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LabelWidget extends StatelessWidget {
  final String label;
  final String value;

  const LabelWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme.labelMedium;
    textTheme = textTheme?.copyWith(
      color: textTheme.color?.withValues(alpha: 0.8),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: textTheme?.copyWith(fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(" : ", style: textTheme),
        Gap(10),
        Expanded(
          child: Text(
            value,
            style: textTheme,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}

class DottedLineVertical extends StatelessWidget {
  final double height;
  final Color color;
  final double dashHeight;
  final double dashGap;

  const DottedLineVertical({
    super.key,
    this.height = 100,
    this.color = Colors.grey,
    this.dashHeight = 5,
    this.dashGap = 3,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(1, height),
      painter: _DottedLinePainter(
        color: color,
        dashHeight: dashHeight,
        dashGap: dashGap,
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  final double dashHeight;
  final double dashGap;

  _DottedLinePainter({
    required this.color,
    required this.dashHeight,
    required this.dashGap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 5;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashGap;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
