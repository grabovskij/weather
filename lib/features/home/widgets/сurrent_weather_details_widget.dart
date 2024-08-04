import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/extensions/context_theme_extensions.dart';
import 'package:weather/core/extensions/string_extensions.dart';
import 'package:weather/core/utils/app_string_format.dart';
import 'package:weather/domain/enums/weather_type.dart';
import 'package:weather/features/home/extensions/weather_type_asset_provider_extension.dart';

class CurrentWeatherDetails extends StatelessWidget {
  final WeatherType weatherType;
  final Color backgroundColor;
  final Color foregroundColor;
  final String cityName;
  final String weatherName;
  final int temp;
  final int feelsLike;
  final DateTime sunset;

  const CurrentWeatherDetails({
    required this.cityName,
    required this.weatherName,
    required this.temp,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.weatherType,
    required this.feelsLike,
    required this.sunset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                'Сегодня',
                style: context.textStyles.headlineLarge.copyWith(
                  color: context.colors.text,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset(
                    weatherType.weatherIconAssetPath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  '$temp°',
                  style: context.textStyles.displayLarge.copyWith(
                    color: context.colors.text,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Text(
              weatherName.capitalize(),
              textAlign: TextAlign.center,
              style: context.textStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                cityName,
                style: context.textStyles.bodyMedium,
              ),
            ),
            Text(
              AppStringFormat.fullDate(DateTime.now()),
              style: context.textStyles.bodyMedium,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
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
