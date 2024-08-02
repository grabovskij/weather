import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/extensions/context_theme_extensions.dart';
import 'package:weather/core/extensions/string_extensions.dart';
import 'package:weather/core/utils/app_string_format.dart';

class WeatherTodayWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String cityName;
  final String weatherName;
  final int temp;
  final int feelsLike;
  final DateTime sunset;

  const WeatherTodayWidget({
    required this.cityName,
    required this.weatherName,
    required this.temp,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.feelsLike,
    required this.sunset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 40,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                'Сегодня',
                style: context.textStyles.headlineLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.cloud,
                      color: foregroundColor,
                      size: 95,
                    ),
                  ),
                  Text(
                    '$temp°',
                    style: context.textStyles.displayLarge.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 120),
              child: Text(
                weatherName.capitalize(),
                textAlign: TextAlign.center,
                style: context.textStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                cityName,
                style: TextStyle(
                  color: foregroundColor,
                  fontSize: 15,
                ),
              ),
            ),
            Text(
              AppStringFormat.fullDate(DateTime.now()),
              style: context.textStyles.bodyMedium,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Ощущается $feelsLike',
                    style: context.textStyles.bodyMedium,
                  ),
                  VerticalDivider(color: foregroundColor, width: 20, thickness: 1),
                  Text(
                    'Закат ${AppStringFormat.time24Hours(sunset)}',
                    style: context.textStyles.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
