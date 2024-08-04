import 'package:flutter/cupertino.dart';
import 'package:weather/core/utils/app_string_format.dart';

/// Mixin для инициализации приложения.
///
/// Применяется к состояниям [State] виджетов, чтобы инициализировать форматирование строк при создании состояния.
mixin ApplicationInitializeStateMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    AppStringFormat.init();
  }
}
