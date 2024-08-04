import 'package:flutter/widgets.dart';
import 'package:weather/core/di/dependency.dart';
import 'package:weather/core/extensions/context_scope_extension.dart';
import 'package:weather/core/mixin/scope_mixin.dart';
import 'package:weather/data/repository/geolocation/geolocation_repository.dart';
import 'package:weather/data/repository/weather_forecast/weather_forecast_repository.dart';

/// Виджет, предоставляющий область видимости для репозиториев.
class RepositoryScope extends StatefulWidget {
  /// Дочерний виджет, который будет иметь доступ к репозиториям.
  final Widget child;

  /// Конструктор [RepositoryScope].
  const RepositoryScope({
    required this.child,
    super.key,
  });

  @override
  State<RepositoryScope> createState() => _RepositoryScopeState();
}

class _RepositoryScopeState extends State<RepositoryScope> with ScopeMixin {
  /// Репозиторий для геолокации.
  late final GeolocationRepository geolocationRepository;

  /// Репозиторий для прогноза погоды.
  late final WeatherForecastRepository weatherForecastRepository;

  @override
  void initState() {
    super.initState();
    _initVariables();
    _registerRepositoryToScope();
  }

  @override
  void dispose() {
    _disposeRepositories();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  /// Инициализация переменных.
  void _initVariables() {
    final dependency = context.read<Dependency>();

    geolocationRepository = GeolocationRepository(dependency.sharedStorage)..init();
    weatherForecastRepository = WeatherForecastRepository(
      read(),
      geolocationRepository,
    );
  }

  /// Регистрация репозиториев в области видимости.
  void _registerRepositoryToScope() {
    write(geolocationRepository);
    write(weatherForecastRepository);
  }

  /// Очистка ресурсов перед уничтожением виджета.
  void _disposeRepositories() {
    geolocationRepository.dispose();
    weatherForecastRepository.dispose();
  }
}
