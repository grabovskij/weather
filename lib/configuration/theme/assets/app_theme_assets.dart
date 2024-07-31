import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/colors/app_theme_color_type.dart';
import 'package:weather/configuration/theme/colors/app_theme_color_type_extension.dart';

class AppThemeAssets extends ThemeExtension<AppThemeAssets> {
  final String background;

  AppThemeAssets({
    required this.background,
  });

  factory AppThemeAssets.create(AppThemeType themeType) {
    return AppThemeAssets(background: themeType.backgroundImageAsset);
  }

  @override
  ThemeExtension<AppThemeAssets> copyWith({
    String? background,
  }) {
    return AppThemeAssets(
      background: background ?? this.background,
    );
  }

  @override
  ThemeExtension<AppThemeAssets> lerp(covariant ThemeExtension<AppThemeAssets>? other, double t) {
    return other ?? this;
  }
}
