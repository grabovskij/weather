import 'package:equatable/equatable.dart';

/// Модель данных для представления информации о ветре.
class Wind extends Equatable {
  /// Скорость ветра.
  final double speed;

  /// Направление ветра.
  final int deg;

  /// Порывы ветра.
  final double gust;

  /// Создает экземпляр информации о ветре с заданными параметрами.
  const Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  @override
  List<Object?> get props => [speed, deg, gust];
}
