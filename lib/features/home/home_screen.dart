import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/extensions/context_theme_extensions.dart';
import 'package:weather/core/di/repository_scope.dart';
import 'package:weather/data/repository/weather_forecast/weather_forecast_repository.dart';
import 'package:weather/features/home/views/home_loaded_view.dart';
import 'package:weather/features/home/views/home_loading_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final WeatherForecastRepository weatherForecastRepository;

  @override
  void initState() {
    super.initState();

    weatherForecastRepository = RepositoryScope.of(context).weatherForecastRepository..init();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(context.themeAssets.background),
          fit: BoxFit.cover,
        ),
      ),
      child: _Body(
        weatherForecastRepository: weatherForecastRepository,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final WeatherForecastRepository weatherForecastRepository;

  const _Body({
    required this.weatherForecastRepository,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: StreamBuilder(
          stream: weatherForecastRepository.stateStream,
          builder: (context, _) {
            final state = weatherForecastRepository.state;

            return switch (state) {
              WeatherForecastLoadedState() => HomeLoadedView(response: state.weatherResponse),
              WeatherForecastLoadingState() => const HomeLoadingView(),
              WeatherForecastErrorState() => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}
