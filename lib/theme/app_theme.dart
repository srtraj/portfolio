import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData getAppTheme({required bool isDark, required bool isMobile}) {
  final colorScheme = isDark
      ? ColorScheme.dark(
          primary: AppColors.darkPrimary,
          secondary: AppColors.darkSecondary,
          surface: AppColors.darkSurface,
        )
      : ColorScheme.light(
          primary: AppColors.lightPrimary,
          secondary: AppColors.lightSecondary,
          surface: AppColors.lightSurface,
        );

  final scaffoldBackgroundColor = isDark
      ? AppColors.darkBackground
      : AppColors.lightBackground;
  final cardColor = isDark ? AppColors.lightCard : AppColors.darkCard;

  final textTheme = isMobile
      ? TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(fontSize: 18),
          bodyMedium: TextStyle(fontSize: 16),
          bodySmall: TextStyle(fontSize: 14),
          labelLarge: TextStyle(fontSize: 14),
          labelMedium: TextStyle(fontSize: 12),
          labelSmall: TextStyle(fontSize: 10),
        )
      : TextTheme(
          titleLarge: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          titleSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(fontSize: 20),
          bodyMedium: TextStyle(fontSize: 18),
          bodySmall: TextStyle(fontSize: 16),
          labelLarge: TextStyle(fontSize: 14),
          labelMedium: TextStyle(fontSize: 12),
          labelSmall: TextStyle(fontSize: 10),
        );

  return ThemeData(
    useMaterial3: true,
    brightness: isDark ? Brightness.dark : Brightness.light,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    cardColor: cardColor,
    textTheme: textTheme,
    cardTheme: CardThemeData(
      color: cardColor,
      elevation: 2,
      surfaceTintColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
    ),
  );
}
