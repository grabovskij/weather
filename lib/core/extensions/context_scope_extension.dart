import 'package:flutter/widgets.dart';
import 'package:weather/core/di/scope.dart';

/// Расширение для [BuildContext], предоставляющее методы чтения и записи значений в [Scope].
extension ContextScopeExtension on BuildContext {
  /// Читает значение из реестра [Scope].
  ///
  /// Возвращает значение типа [T].
  /// Бросает исключение, если значение не найдено.
  T read<T>() => Scope.read();

  /// Записывает значение в реестр [Scope].
  ///
  /// [value] - значение для записи.
  ///
  /// Возвращает записанное значение.
  T write<T>(T value) => Scope.write(value);
}
