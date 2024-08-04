import 'package:weather/core/di/scope.dart';

/// Миксин для использования функций класса [Scope].
mixin ScopeMixin {
  /// Записывает значение в реестр.
  ///
  /// [value] - значение для записи.
  /// [replace] - флаг, указывающий, нужно ли заменить существующее значение.
  ///
  /// Возвращает записанное значение.
  T write<T>(T value, {bool replace = false}) {
    return Scope.write(value, replace: replace);
  }

  /// Читает значение из реестра.
  ///
  /// Возвращает значение типа [T].
  /// Бросает исключение, если значение не найдено.
  T read<T>() {
    return Scope.read<T>();
  }

  /// Читает значение из реестра или возвращает null, если значение не найдено.
  ///
  /// Возвращает значение типа [T] или null.
  T? readOrNull<T>() {
    return Scope.readOrNull<T>();
  }

  /// Очищает реестр.
  void dispose() {
    Scope.dispose();
  }
}
