import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final Color primary;
  final Color secondary;
  final Color text;

  AppColorsTheme({
    required this.primary,
    required this.secondary,
    required this.text,
  });

  @override
  ThemeExtension<AppColorsTheme> copyWith({
    Color? primary,
    Color? secondary,
    Color? text,
  }) {
    return AppColorsTheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      text: text ?? this.text,
    );
  }

  @override
  AppColorsTheme lerp(
    AppColorsTheme other,
    double t,
  ) {
    return AppColorsTheme(
      primary: ColorTween(begin: other.primary, end: primary).lerp(t)!,
      secondary: ColorTween(begin: other.secondary, end: secondary).lerp(t)!,
      text: ColorTween(begin: other.text, end: text).lerp(t)!,
    );
  }
}
