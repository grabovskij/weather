import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final Color secondary;
  final Color primary;
  final Color text;

  AppColorsTheme({
    required this.secondary,
    required this.primary,
    required this.text,
  });

  @override
  ThemeExtension<AppColorsTheme> copyWith({
    Color? primary,
    Color? secondary,
    Color? text,
  }) {
    return AppColorsTheme(
      secondary: primary ?? this.secondary,
      primary: secondary ?? this.primary,
      text: text ?? this.text,
    );
  }

  @override
  AppColorsTheme lerp(
    AppColorsTheme other,
    double t,
  ) {
    return AppColorsTheme(
      secondary: ColorTween(begin: other.secondary, end: secondary).lerp(t)!,
      primary: ColorTween(begin: other.primary, end: primary).lerp(t)!,
      text: ColorTween(begin: other.text, end: text).lerp(t)!,
    );
  }
}
