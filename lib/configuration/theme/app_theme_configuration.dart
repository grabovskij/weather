import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/assets/app_theme_assets.dart';
import 'package:weather/configuration/theme/colors/app_theme_color_type.dart';
import 'package:weather/configuration/theme/colors/app_theme_color_type_extension.dart';
import 'package:weather/configuration/theme/text/app_text_theme.dart';

abstract class AppThemeConfiguration {
  static ThemeData create([AppThemeType themeType = AppThemeType.cloudy1]) {
    final appColorsTheme = themeType.createColorTheme();
    final appThemeAssets = AppThemeAssets.create(themeType);
    final appTextTheme = AppTextTheme.create(secondaryColor: appColorsTheme.secondary, textColor: appColorsTheme.text);

    return ThemeData(
      useMaterial3: true,
      extensions: [
        appColorsTheme,
        appThemeAssets,
        appTextTheme,
      ],
    );
  }
}
