import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:weather/core/di/dependency_scope.dart';
import 'package:weather/core/environment.dart';
import 'package:weather/data/data_sources/weather_forecast/weather_forecast.dart';
import 'package:weather/data/repository/weather_forecast/weather_forecast_repository.dart';

class RepositoryProvider extends InheritedWidget {
  final WeatherForecastRepository weatherForecastRepository;

  const RepositoryProvider({
    required this.weatherForecastRepository,
    required super.child,
    super.key,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

class RepositoryScope extends StatefulWidget {
  static RepositoryProvider? maybeOf(BuildContext context) =>
      context.findAncestorWidgetOfExactType<RepositoryProvider>();

  static RepositoryProvider of(BuildContext context) => maybeOf(context)!;

  final Widget child;

  const RepositoryScope({
    required this.child,
    super.key,
  });

  @override
  State<RepositoryScope> createState() => _RepositoryScopeState();
}

class _RepositoryScopeState extends State<RepositoryScope> {
  late final WeatherForecastRepository weatherForecastRepository;
  late final Dio _dio;

  @override
  void initState() {
    super.initState();
    _initVariables();
  }

  @override
  void dispose() {
    _disposeRepositories();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      weatherForecastRepository: weatherForecastRepository,
      child: widget.child,
    );
  }

  void _initVariables() {
    _dio = DependencyScope.of(context).dio;

    weatherForecastRepository = WeatherForecastRepository(
      WeatherForecastDataSource(_dio, appId: Environment.appid),
    );
  }

  void _disposeRepositories() {
    weatherForecastRepository.dispose();
  }
}
