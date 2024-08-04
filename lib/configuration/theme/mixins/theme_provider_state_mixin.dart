import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/app_theme_configuration.dart';
import 'package:weather/configuration/theme/app_theme_type.dart';
import 'package:weather/configuration/theme/extensions/weather_type_to_app_theme_extension.dart';
import 'package:weather/core/extensions/context_scope_extension.dart';
import 'package:weather/data/repository/weather_forecast/weather_forecast_repository.dart';
import 'package:weather/domain/extensions/weather_condition_parser_extension.dart';
import 'package:weather/domain/models/weather_forecast/weather_data.dart';

mixin ThemeProviderStateMixin<T extends StatefulWidget> on State<T> {
  AppThemeType _appThemeType = AppThemeType.sunny2;

  StreamSubscription<WeatherData>? _weatherListener;

  ThemeData get theme => AppThemeConfiguration.create(_appThemeType);

  @override
  void initState() {
    super.initState();
    _weatherListener = context.read<WeatherForecastRepository>().currentWeatherStream.listen(_onChangeWeather);
  }

  @override
  void dispose() {
    _weatherListener?.cancel();
    super.dispose();
  }

  void _onChangeWeather(WeatherData weather) {
    setState(() {
      _appThemeType = weather.weather.first.weatherType.toAppThemeType();
    });
  }
}
