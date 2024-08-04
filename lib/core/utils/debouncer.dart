import 'dart:async';

import 'package:flutter/foundation.dart';

/// Класс, реализующий механизм "debounce" (защита от дребезга).
/// Позволяет вызывать функцию только после определенного периода бездействия.
class Debouncer {
  /// Задержка перед вызовом функции
  final Duration _delay;

  /// Таймер для отслеживания времени задержки
  Timer? _timer;

  /// Конструктор, принимающий время задержки
  Debouncer(this._delay);

  /// Метод для выполнения "debounce".
  /// Вызывает переданный callback только после того,
  /// как пройдет заданная задержка `_delay`.
  void debounce(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(_delay, callback);
  }

  /// Метод для очистки таймера
  void dispose() {
    _timer?.cancel();
  }
}
