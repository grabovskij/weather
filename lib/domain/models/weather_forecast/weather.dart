import 'package:equatable/equatable.dart';

/// Модель данных для представления информации о погоде.
class Weather extends Equatable {
  /// Идентификатор погодного условия.
  final int id;

  /// Основное описание погодного условия.
  final String main;

  /// Подробное описание погодного условия.
  final String description;

  /// Иконка, представляющая погодное условие.
  final String icon;

  /// Создает экземпляр погодного условия с заданными параметрами.
  const Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  List<Object?> get props => [id, main, description, icon];
}
