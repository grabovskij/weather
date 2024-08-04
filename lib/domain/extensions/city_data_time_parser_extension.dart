import 'package:weather/domain/models/weather_forecast/city.dart';

/// Расширение для класса [City], предоставляющее методы для получения времени восхода и заката.
extension CityDataTimeParser on City {
  /// Преобразует время заката, хранящееся в миллисекундах с начала эпохи, в объект [DateTime].
  ///
  /// Возвращает [DateTime], представляющий время заката.
  DateTime get sunsetDataTime => DateTime.fromMillisecondsSinceEpoch(sunset, isUtc: true);

  /// Преобразует время восхода, хранящееся в миллисекундах с начала эпохи, в объект [DateTime].
  ///
  /// Возвращает [DateTime], представляющий время восхода.
  DateTime get sunriseDataTime => DateTime.fromMillisecondsSinceEpoch(sunrise, isUtc: true);
}
