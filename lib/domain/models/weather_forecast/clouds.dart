import 'package:equatable/equatable.dart';

/// Модель данных для представления облачности.
class Clouds extends Equatable {
  /// Процент облачности.
  final int all;

  /// Создает экземпляр облачности с заданным процентом облачности.
  const Clouds({
    required this.all,
  });

  @override
  List<Object?> get props => [all];
}
