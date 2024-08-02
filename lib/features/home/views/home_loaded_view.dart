import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/extensions/context_theme_extensions.dart';
import 'package:weather/core/di/repository_scope.dart';
import 'package:weather/core/utils/app_string_format.dart';
import 'package:weather/domain/enums/weather_type.dart';
import 'package:weather/domain/extensions/city_data_time_parser.dart';
import 'package:weather/domain/models/weather_response.dart';
import 'package:weather/features/home/extensions/weather_type_asset_provider.dart';
import 'package:weather/features/home/widgets/weather_today_widget.dart';

class HomeLoadedView extends StatelessWidget {
  final WeatherResponse response;

  const HomeLoadedView({
    required this.response,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: StreamBuilder(
            stream: RepositoryScope.of(context).weatherForecastRepository.currentWeatherStream,
            builder: (context, snapshot) {
              final weatherData = snapshot.data;

              if (weatherData == null) {
                return const SizedBox.shrink();
              }

              return WeatherTodayWidget(
                backgroundColor: context.colors.secondary,
                foregroundColor: context.colors.primary,
                cityName: response.city.name,
                weatherName: weatherData.weather.first.description,
                temp: (weatherData.main.temp - 273.15).toInt(),
                feelsLike: (weatherData.main.feelsLike - 273.15).toInt(),
                sunset: response.city.sunsetDataTime,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
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

                          return WeatherPreviewWidget(
                            degreesCelsius: (weatherData.main.temp - 273.15).toInt(),
                            weatherType: WeatherType.rain,
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

                          return WeatherPreviewWidget(
                            degreesCelsius: (weatherData.main.temp - 273.15).toInt(),
                            weatherType: WeatherType.rain,
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
        ),
      ],
    );
  }
}

class WeatherPreviewWidget extends StatelessWidget {
  final String time;
  final int degreesCelsius;
  final WeatherType weatherType;

  const WeatherPreviewWidget({
    required this.degreesCelsius,
    required this.weatherType,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            time,
            style: context.textStyles.bodyMedium,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                weatherType.weatherIconAssetPath,
                width: 24,
              ),
              Text(
                '$degreesCelsius°',
                style: context.textStyles.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
