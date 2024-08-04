import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/app_theme_type.dart';
import 'package:weather/configuration/theme/colors/app_colors_theme.dart';
import 'package:weather/core/constants/asset_images.dart';

extension AppThemeColorTypeExtension on AppThemeType {
  String get backgroundImageAsset {
    return switch (this) {
      AppThemeType.cloudy1 => AssetImages.cloudy1,
      AppThemeType.cloudy2 => AssetImages.cloudy2,
      AppThemeType.cloudy3 => AssetImages.cloudy3,
      AppThemeType.cloudy4 => AssetImages.cloudy4,
      AppThemeType.sunny1 => AssetImages.sunny1,
      AppThemeType.sunny2 => AssetImages.sunny2,
      AppThemeType.rainy1 => AssetImages.rainy1,
      AppThemeType.rainy2 => AssetImages.rainy2,
      AppThemeType.rainy3 => AssetImages.rainy3,
      AppThemeType.snowy1 => AssetImages.snowy1,
      AppThemeType.snowy2 => AssetImages.snowy2,
    };
  }

  Color get primaryColor {
    return switch (this) {
      AppThemeType.cloudy1 => const Color(0xFF91B4C6),
      AppThemeType.cloudy2 => const Color(0xFF5A8BAB),
      AppThemeType.cloudy3 => const Color(0xFFAC736A),
      AppThemeType.cloudy4 => const Color(0xFF9090AC),
      AppThemeType.sunny1 => const Color(0xFFFAE2BD),
      AppThemeType.sunny2 => const Color(0xFF9FDCA8),
      AppThemeType.rainy1 => const Color(0xFF40666A),
      AppThemeType.rainy2 => const Color(0xFF615273),
      AppThemeType.rainy3 => const Color(0xFF7FC3AE),
      AppThemeType.snowy1 => const Color(0xFFA7ACC4),
      AppThemeType.snowy2 => const Color(0xFFA7ACC4),
    };
  }

  Color get secondaryColor {
    return switch (this) {
      AppThemeType.cloudy1 => const Color(0xFFCAD7DF),
      AppThemeType.cloudy2 => const Color(0xFFAED5E4),
      AppThemeType.cloudy3 => const Color(0xFFF6C8A4),
      AppThemeType.cloudy4 => const Color(0xFF484A82),
      AppThemeType.sunny1 => const Color(0xFFEFAA82),
      AppThemeType.sunny2 => const Color(0xFF71A78F),
      AppThemeType.rainy1 => const Color(0xFFC9E8E0),
      AppThemeType.rainy2 => const Color(0xFFC2B8FF),
      AppThemeType.rainy3 => const Color(0xFFC9E8E0),
      AppThemeType.snowy1 => const Color(0xFFE4F1F9),
      AppThemeType.snowy2 => const Color(0xFFE2E2E3),
    };
  }

  AppColorsTheme createColorTheme() {
    return AppColorsTheme(
      secondary: primaryColor,
      primary: secondaryColor,
      text: Colors.white,
    );
  }
}
