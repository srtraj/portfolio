// File: main.dart

import 'package:flutter/material.dart';
import 'package:portpolio/view/portfolio_page.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portpolio/theme/app_theme.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Builder(
          builder: (context) {
            final isMobile = constraints.maxWidth <= 450;
            return MaterialApp(
              title: 'Sharathraj A | Portfolio',
              debugShowCheckedModeBanner: false,
              theme: getAppTheme(isDark: false, isMobile: isMobile),
              darkTheme: getAppTheme(isDark: true, isMobile: isMobile),
              builder: (context, child) => ResponsiveBreakpoints.builder(
                child: BouncingScrollWrapper.builder(context, child!),
                breakpoints: const [
                  Breakpoint(start: 0, end: 450, name: MOBILE),
                  Breakpoint(start: 451, end: 900, name: TABLET),
                  Breakpoint(start: 901, end: 1920, name: DESKTOP),
                  Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                ],
              ),
              home: const PortfolioPage(),
            );
          },
        );
      },
    );
  }
}
