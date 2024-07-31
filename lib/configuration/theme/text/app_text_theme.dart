import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/text/text_styles.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle displayLarge;
  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle bodyMedium;

  AppTextTheme({
    required this.displayLarge,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.bodyMedium,
  });

  factory AppTextTheme.create({
    required Color secondaryColor,
    required Color textColor,
  }) {
    return AppTextTheme(
      displayLarge: TextStyles.displayLarge(secondaryColor),
      headlineLarge: TextStyles.headlineLarge(secondaryColor),
      headlineMedium: TextStyles.headlineMedium(secondaryColor),
      bodyMedium: TextStyles.bodyMedium(textColor),
    );
  }

  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? displayLarge,
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? bodyMedium,
  }) {
    return AppTextTheme(
      displayLarge: displayLarge ?? this.displayLarge,
      headlineLarge: headlineLarge ?? this.headlineLarge,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      bodyMedium: bodyMedium ?? this.bodyMedium,
    );
  }

  @override
  ThemeExtension<AppTextTheme> lerp(AppTextTheme? other, double t) {
    return other ?? this;
  }
}
