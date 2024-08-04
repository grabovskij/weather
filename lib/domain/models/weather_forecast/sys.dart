import 'package:equatable/equatable.dart';

/// Модель данных для представления системной информации о погоде.
class Sys extends Equatable {
  /// Часть дня (d - день, n - ночь).
  final String pod;

  /// Создает экземпляр системной информации с заданной частью дня.
  const Sys({
    required this.pod,
  });

  @override
  List<Object?> get props => [pod];
}
