import 'package:equatable/equatable.dart';
import 'package:weather/domain/models/city.dart';
import 'package:weather/domain/models/weather_data.dart';

/// Модель данных для представления ответа на запрос погоды.
class WeatherResponse extends Equatable {
  /// Код ответа.
  final String cod;

  /// Сообщение.
  final int message;

  /// Количество данных.
  final int cnt;

  /// Список погодных данных.
  final List<WeatherData> list;

  /// Информация о городе.
  final City city;

  /// Создает экземпляр ответа на запрос погоды с заданными параметрами.
  const WeatherResponse({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  @override
  List<Object?> get props => [cod, message, cnt, list, city];
}
