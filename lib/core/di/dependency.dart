import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/di/scope.dart';
import 'package:weather/core/services/shared_storage.dart';

/// Класс для инициализации и управления зависимостями.
class Dependency {
  /// Инициализация зависимостей.
  ///
  /// [widgetsBinding] - привязка виджетов для инициализации.
  ///
  /// Возвращает [Future] с экземпляром [Dependency].
  static Future<Dependency> init(WidgetsBinding widgetsBinding) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final dependency = Dependency(
      dio: Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
        ),
      ),
      sharedStorage: SharedStorage(sharedPreferences),
    );

    Scope.write(dependency);

    return dependency;
  }

  /// Экземпляр Dio для выполнения сетевых запросов.
  final Dio dio;

  /// Экземпляр SharedStorage для работы с локальным хранилищем.
  final SharedStorage sharedStorage;

  /// Конструктор для [Dependency].
  ///
  /// [dio] - экземпляр Dio.
  /// [sharedStorage] - экземпляр SharedStorage.
  const Dependency({
    required this.dio,
    required this.sharedStorage,
  });
}
