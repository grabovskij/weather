import 'package:equatable/equatable.dart';
import 'package:weather/domain/models/coordinates.dart';

/// Модель данных для представления информации о городе.
class City extends Equatable {
  /// Идентификатор города.
  final int id;

  /// Название города.
  final String name;

  /// Координаты города.
  final Coordinates coord;

  /// Страна.
  final String country;

  /// Население города.
  final int population;

  /// Часовой пояс города.
  final int timezone;

  /// Время восхода солнца в формате Unix.
  final int sunrise;

  /// Время заката солнца в формате Unix.
  final int sunset;

  /// Создает экземпляр информации о городе с заданными параметрами.
  const City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        coord,
        country,
        population,
        timezone,
        sunrise,
        sunset,
      ];
}
