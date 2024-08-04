import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/extensions/context_theme_extensions.dart';
import 'package:weather/core/extensions/context_scope_extension.dart';
import 'package:weather/core/extensions/num_extensions.dart';
import 'package:weather/data/repository/weather_forecast/weather_forecast_repository.dart';
import 'package:weather/domain/extensions/city_data_time_parser_extension.dart';
import 'package:weather/domain/extensions/weather_condition_parser_extension.dart';
import 'package:weather/domain/models/weather_forecast/weather_response.dart';
import 'package:weather/features/home/widgets/%D1%81urrent_weather_details_widget.dart';

class CurrentWeatherDisplay extends StatelessWidget {
  final WeatherResponse response;

  const CurrentWeatherDisplay({
    required this.response,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<WeatherForecastRepository>().currentWeatherStream,
      builder: (context, snapshot) {
        final weatherData = snapshot.data;

        if (weatherData == null) {
          return const SizedBox.shrink();
        }

        return CurrentWeatherDetails(
          cityName: '${response.city.name} (${response.city.country})',
          weatherType: weatherData.weather.first.weatherType,
          weatherName: weatherData.weather.first.description,
          temp: weatherData.main.temp.fromKelvinToIntCelsius(),
          feelsLike: weatherData.main.feelsLike.fromKelvinToIntCelsius(),
          sunset: response.city.sunsetDataTime,
          backgroundColor: context.colors.secondary,
          foregroundColor: context.colors.primary,
        );
      },
    );
  }
}
