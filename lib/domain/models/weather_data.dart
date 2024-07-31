import 'package:equatable/equatable.dart';
import 'package:weather/domain/models/clouds.dart';
import 'package:weather/domain/models/main_weather_info.dart';
import 'package:weather/domain/models/sys.dart';
import 'package:weather/domain/models/weather.dart';
import 'package:weather/domain/models/wind.dart';

/// Модель данных для представления погодных данных за определенный момент времени.
class WeatherData extends Equatable {
  /// Время данных в формате Unix.
  final int dt;

  /// Основная информация о погоде.
  final MainWeatherInfo main;

  /// Список погодных условий.
  final List<Weather> weather;

  /// Облачность.
  final Clouds clouds;

  /// Ветер.
  final Wind wind;

  /// Видимость.
  final int visibility;

  /// Вероятность осадков.
  final double pop;

  /// Системная информация.
  final Sys sys;

  /// Текстовое представление времени данных.
  final String dtTxt;

  /// DateTime представление времени данных.
  final DateTime dateTime;

  /// Количество дождя за последние 3 часа (может быть null).
  final double? rain;

  /// Создает экземпляр погодных данных с заданными параметрами.
  const WeatherData({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
    required this.dateTime,
    this.rain,
  });

  @override
  List<Object?> get props => [
        dt,
        main,
        weather,
        clouds,
        wind,
        visibility,
        pop,
        sys,
        dtTxt,
        rain,
      ];
}
