import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/extensions/context_theme_extensions.dart';
import 'package:weather/core/utils/app_string_format.dart';
import 'package:weather/domain/extensions/weather_condition_parser_extension.dart';
import 'package:weather/domain/models/weather_forecast/weather_response.dart';
import 'package:weather/features/home/widgets/weather_small_preview_widget.dart';

class WeekWeatherWidget extends StatelessWidget {
  final WeatherResponse response;

  const WeekWeatherWidget({
    required this.response,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: IntrinsicWidth(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    response.list.length.clamp(0, 5),
                    (index) {
                      final weatherData = response.list[index];
                      final dateTime = weatherData.dateTime;
                      final time = AppStringFormat.time24Hours(dateTime);

                      return WeatherSmallPreviewWidget(
                        degreesCelsius: (weatherData.main.temp - 273.15).toInt(),
                        weatherType: weatherData.weather.first.weatherType,
                        time: time,
                      );
                    },
                  ),
                ),
                Divider(color: context.colors.text, height: 41, indent: 32, endIndent: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    response.list.length.clamp(0, 5),
                    (index) {
                      final weatherData = response.list[index + 5];
                      final dateTime = weatherData.dateTime;
                      final time = AppStringFormat.time24Hours(dateTime);

                      return WeatherSmallPreviewWidget(
                        degreesCelsius: (weatherData.main.temp - 273.15).toInt(),
                        weatherType: weatherData.weather.first.weatherType,
                        time: time,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
