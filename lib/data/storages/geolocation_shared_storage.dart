import 'dart:convert';

import 'package:weather/core/services/shared_storage.dart';
import 'package:weather/domain/models/geocoding/city.dart';

/// Миксин для хранения и получения данных о геолокации с использованием [SharedStorage].
mixin GeolocationSharedStorage {
  /// Ключ для хранения данных о городе в хранилище.
  static const _key = 'GeolocationRepositoryKey';

  /// Экземпляр хранилища.
  SharedStorage get storage;

  /// Получает город из хранилища.
  ///
  /// Возвращает объект [City], если данные найдены, или null, если данные отсутствуют.
  City? getCity() {
    final value = storage.getString(_key);

    if (value == null) {
      return null;
    }

    final json = jsonDecode(value);

    return City.fromJson(json);
  }

  /// Сохраняет город в хранилище.
  ///
  /// [city] - объект [City] для сохранения.
  ///
  /// Возвращает [Future], содержащее значение [bool], указывающее на успешность операции.
  Future<bool> saveCity(City city) {
    final json = city.toJson();

    return storage.setString(key: _key, value: jsonEncode(json));
  }
}
