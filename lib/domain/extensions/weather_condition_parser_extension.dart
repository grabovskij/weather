import 'package:weather/domain/enums/weather_condition_codes.dart';
import 'package:weather/domain/enums/weather_type.dart';
import 'package:weather/domain/extensions/weather_condition_code_extension.dart';
import 'package:weather/domain/models/weather_forecast/weather.dart';

extension WeatherConditionParserExtension on Weather {
  /// Перечисление кодов погодных условий.
  ///
  /// Используется для представления различных погодных условий с кодами, соответствующими OpenWeatherMap API.
  WeatherConditionCode get weatherConditionCode => WeatherConditionCode.fromId(id);

  /// Перечисление типов погоды.
  WeatherType get weatherType => weatherConditionCode.toWeatherType();
}
