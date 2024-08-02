import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

/// Виджет, предоставляющий зависимости своим потомкам.
///
/// Виджет `DependencyProvider` используется для предоставления зависимостей
/// в поддерево виджетов. Это позволяет любому потомку получить доступ к этому экземпляру
/// с использованием `DependencyProvider.of(context)`.
///
/// `DependencyProvider` наследуется от `InheritedWidget`, что позволяет эффективно
/// распространять его через дерево виджетов без необходимости передавать экземпляры
/// через параметры.
///
/// Пример использования:
/// ```dart
/// DependencyScope(
///   child: MyApp(),
/// );
/// ```
///
/// Потомки могут получить доступ к экземпляру `Dio` следующим образом:
/// ```dart
/// final dio = DependencyScope.of(context).dio;
/// ```
class DependencyProvider extends InheritedWidget {
  /// Экземпляр `Dio`, который предоставляется потомкам.
  final Dio dio;

  /// Конструктор, требующий экземпляр `Dio` и дочерний виджет.
  const DependencyProvider({
    required this.dio,
    required super.child,
    super.key,
  });

  /// Определяет, следует ли уведомлять зависимые виджеты об изменении.
  ///
  /// В текущей реализации всегда возвращает `false`, что означает, что изменения в провайдере
  /// не будут автоматически вызывать перестройку зависимых виджетов.
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

/// Виджет, управляющий жизненным циклом зависимостей и предоставляющий их своим потомкам.
///
/// Виджет `DependencyScope` используется для создания и управления экземпляром `Dio`,
/// а также для его предоставления через `DependencyProvider`. Это упрощает инициализацию
/// и управление зависимостями в приложении.
///
/// Пример использования:
/// ```dart
/// DependencyScope(
///   child: MyApp(),
/// );
/// ```
class DependencyScope extends StatefulWidget {
  /// Ищет ближайший предковый виджет `DependencyProvider` и возвращает его, если найден.
  ///
  /// Этот метод возвращает `null`, если `DependencyProvider` не найден в цепочке предков.
  static DependencyProvider? maybeOf(BuildContext context) =>
      context.getInheritedWidgetOfExactType<DependencyProvider>();

  /// Ищет ближайший предковый виджет `DependencyProvider` и возвращает его.
  ///
  /// Выбрасывает ошибку, если `DependencyProvider` не найден в цепочке предков.
  static DependencyProvider of(BuildContext context) => maybeOf(context)!;

  /// Дочерний виджет, который будет иметь доступ к предоставленным зависимостям.
  final Widget child;

  /// Конструктор, требующий дочерний виджет.
  const DependencyScope({
    required this.child,
    super.key,
  });

  @override
  State<DependencyScope> createState() => _DependencyScopeState();
}

class _DependencyScopeState extends State<DependencyScope> {
  late final Dio _dio;

  @override
  void initState() {
    super.initState();
    _initVariables();
  }

  @override
  void dispose() {
    _disposeVariables();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DependencyProvider(
      dio: _dio,
      child: widget.child,
    );
  }

  /// Инициализирует переменные, используемые в `DependencyScope`.
  void _initVariables() {
    _dio = Dio();
  }

  /// Освобождает ресурсы, используемые в `DependencyScope`.
  void _disposeVariables() {
    _dio.close();
  }
}
