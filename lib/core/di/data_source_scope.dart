import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:weather/core/di/dependency.dart';
import 'package:weather/core/environment.dart';
import 'package:weather/core/extensions/context_scope_extension.dart';
import 'package:weather/core/mixin/scope_mixin.dart';
import 'package:weather/data/data_sources/geocoding/geocoding.dart';
import 'package:weather/data/data_sources/weather_forecast/weather_forecast.dart';

/// Виджет, предоставляющий область видимости для данных источников.
class DataSourceScope extends StatefulWidget {
  /// Дочерний виджет, который будет иметь доступ к данным источникам.
  final Widget child;

  /// Конструктор [DataSourceScope].
  const DataSourceScope({
    required this.child,
    super.key,
  });

  @override
  State<DataSourceScope> createState() => _DataSourceScopeState();
}

class _DataSourceScopeState extends State<DataSourceScope> with ScopeMixin {
  /// Источник данных для прогноза погоды.
  late final WeatherForecastDataSource weatherForecastDataSource;

  /// Источник данных для геокодирования.
  late final GeocodingDataSource geocodingDataSource;

  /// Экземпляр Dio для выполнения сетевых запросов.
  late final Dio _dio;

  @override
  void initState() {
    super.initState();
    _initVariables();
    _registerDataSources();
  }

  @override
  void dispose() {
    _disposeDataSources();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  /// Инициализация переменных.
  void _initVariables() {
    _dio = context.read<Dependency>().dio;

    weatherForecastDataSource = WeatherForecastDataSource(_dio, appId: Environment.appid);
    geocodingDataSource = GeocodingDataSource(dio: _dio, appId: Environment.appid);
  }

  /// Регистрация источников данных в области видимости.
  void _registerDataSources() {
    write(weatherForecastDataSource);
    write(geocodingDataSource);
  }

  /// Очистка ресурсов перед уничтожением виджета.
  void _disposeDataSources() {}
}
