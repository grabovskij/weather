import 'package:equatable/equatable.dart';

class Coordinates extends Equatable {
  /// Широта.
  final double lat;

  /// Долгота.
  final double lon;

  /// Создает экземпляр координат с заданными широтой и долготой.
  const Coordinates({
    required this.lat,
    required this.lon,
  });

  @override
  List<Object?> get props => [lat, lon];
}
