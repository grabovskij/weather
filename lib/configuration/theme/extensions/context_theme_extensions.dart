import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/assets/app_theme_assets.dart';
import 'package:weather/configuration/theme/colors/app_colors_theme.dart';
import 'package:weather/configuration/theme/text/app_text_theme.dart';

extension ContextThemeExtensions on BuildContext {
  AppThemeAssets get themeAssets => Theme.of(this).extension<AppThemeAssets>()!;

  AppColorsTheme get colors => Theme.of(this).extension<AppColorsTheme>()!;

  AppTextTheme get textStyles => Theme.of(this).extension<AppTextTheme>()!;
}
