import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/extensions/context_theme_extensions.dart';
import 'package:weather/domain/enums/weather_type.dart';
import 'package:weather/features/home/extensions/weather_type_asset_provider_extension.dart';

class WeatherSmallPreviewWidget extends StatelessWidget {
  final String time;
  final int degreesCelsius;
  final WeatherType weatherType;

  const WeatherSmallPreviewWidget({
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
                height: 24,
                fit: BoxFit.contain,
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
