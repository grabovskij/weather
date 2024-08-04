import 'package:flutter/material.dart';
import 'package:weather/core/extensions/context_scope_extension.dart';
import 'package:weather/data/repository/weather_forecast/weather_forecast_repository.dart';
import 'package:weather/features/home/views/home_error_view.dart';
import 'package:weather/features/home/views/home_loaded_view.dart';
import 'package:weather/features/home/views/home_loading_view.dart';

class HomeDisplay extends StatelessWidget {
  const HomeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherForecastRepository = context.read<WeatherForecastRepository>();

    return StreamBuilder(
      stream: weatherForecastRepository.stateStream,
      builder: (context, _) {
        final state = weatherForecastRepository.state;

        return switch (state) {
          WeatherForecastLoadedState() => HomeLoadedView(response: state.weatherResponse),
          WeatherForecastLoadingState() => const HomeLoadingView(),
          WeatherForecastErrorState() => const HomeErrorView(),
        };
      },
    );
  }
}
