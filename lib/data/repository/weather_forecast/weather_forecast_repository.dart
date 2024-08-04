import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:weather/data/data_sources/weather_forecast/weather_forecast.dart';
import 'package:weather/data/repository/geolocation/geolocation_repository.dart';
import 'package:weather/data/repository/weather_forecast/mappers/state_to_current_weather_mapper.dart';
import 'package:weather/domain/models/geocoding/city.dart';
import 'package:weather/domain/models/weather_forecast/weather_data.dart';
import 'package:weather/domain/models/weather_forecast/weather_response.dart';

/// Базовый класс состояния прогноза погоды.
sealed class WeatherForecastState {}

/// Состояние загрузки прогноза погоды.
class WeatherForecastLoadingState extends WeatherForecastState {}

/// Состояние успешной загрузки прогноза погоды.
class WeatherForecastLoadedState extends WeatherForecastState {
  /// Ответ с прогнозом погоды.
  final WeatherResponse weatherResponse;

  /// Конструктор для [WeatherForecastLoadedState].
  WeatherForecastLoadedState(this.weatherResponse);
}

/// Состояние ошибки при загрузке прогноза погоды.
class WeatherForecastErrorState extends WeatherForecastState {
  /// Ошибка, возникшая при загрузке.
  final dynamic error;

  /// Конструктор для [WeatherForecastErrorState].
  WeatherForecastErrorState(this.error);
}

/// Репозиторий для работы с прогнозом погоды.
class WeatherForecastRepository {
  /// Источник данных прогноза погоды.
  final WeatherForecastDataSource _dataSource;

  /// Репозиторий геолокации.
  final GeolocationRepository _geolocationRepository;

  /// Субъект состояния для управления состояниями прогноза погоды.
  final BehaviorSubject<WeatherForecastState> _stateSubject = BehaviorSubject.seeded(WeatherForecastLoadingState());

  /// Подписка на изменения города.
  StreamSubscription<City>? _citySubscription;

  /// Конструктор для [WeatherForecastRepository].
  WeatherForecastRepository(
    WeatherForecastDataSource weatherForecastSource,
    GeolocationRepository geolocationRepository,
  )   : _dataSource = weatherForecastSource,
        _geolocationRepository = geolocationRepository {
    _citySubscription = _geolocationRepository.cityStream.listen((_) => init());
  }

  /// Текущее состояние прогноза погоды.
  WeatherForecastState get state => _stateSubject.value;

  /// Поток состояний прогноза погоды.
  Stream<WeatherForecastState> get stateStream => _stateSubject;

  /// Поток текущей погоды.
  Stream<WeatherData> get currentWeatherStream =>
      stateStream.whereType<WeatherForecastLoadedState>().map(extractCurrentWeather);

  /// Инициализация репозитория прогноза погоды.
  Future<void> init() async {
    _stateSubject.add(WeatherForecastLoadingState());

    final city = _geolocationRepository.city;

    _dataSource
        .getWeather(lat: city.lat, lon: city.lon)
        .then((response) => _stateSubject.add(WeatherForecastLoadedState(response)))
        .onError((e, s) => _stateSubject.add(WeatherForecastErrorState(e)));
  }

  /// Освобождение ресурсов.
  void dispose() {
    _citySubscription?.cancel();
    _stateSubject.close();
  }
}
