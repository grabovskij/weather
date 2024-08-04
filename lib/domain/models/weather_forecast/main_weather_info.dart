import 'package:equatable/equatable.dart';

/// Модель данных для представления основной информации о погоде.
class MainWeatherInfo extends Equatable {
  /// Температура.
  final double temp;

  /// Ощущаемая температура.
  final double feelsLike;

  /// Минимальная температура.
  final double tempMin;

  /// Максимальная температура.
  final double tempMax;

  /// Давление.
  final int pressure;

  /// Давление на уровне моря.
  final int seaLevel;

  /// Давление на уровне земли.
  final int grndLevel;

  /// Влажность.
  final int humidity;

  /// Коррекция температуры.
  final double tempKf;

  /// Создает экземпляр основной информации о погоде с заданными параметрами.
  const MainWeatherInfo({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        seaLevel,
        grndLevel,
        humidity,
        tempKf,
      ];
}
