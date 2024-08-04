import 'package:flutter/material.dart';
import 'package:weather/domain/models/weather_forecast/weather_response.dart';
import 'package:weather/features/geolocation/geolocation_search_field.dart';
import 'package:weather/features/home/widgets/current_weather_display_widget.dart';
import 'package:weather/features/home/widgets/week_weather_widget.dart';

class HomeLoadedView extends StatelessWidget {
  final WeatherResponse response;

  const HomeLoadedView({
    required this.response,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const GeolocationSearchField(),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: CurrentWeatherDisplay(
                response: response,
                key: ValueKey(response),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: WeekWeatherWidget(
                response: response,
                key: ValueKey(response),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
