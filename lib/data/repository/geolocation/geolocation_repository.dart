import 'package:rxdart/rxdart.dart';
import 'package:weather/core/services/shared_storage.dart';
import 'package:weather/data/storages/geolocation_shared_storage.dart';
import 'package:weather/domain/models/geocoding/city.dart';

/// Абстрактный класс для репозитория геолокации.
abstract class GeolocationRepository {
  /// Фабричный конструктор для создания экземпляра [_GeolocationRepository].
  factory GeolocationRepository(SharedStorage storage) => _GeolocationRepository(storage);

  /// Текущий город.
  City get city;

  /// Поток для отслеживания изменений города.
  Stream<City> get cityStream;

  /// Инициализация репозитория.
  Future<void> init();

  /// Установка нового города.
  ///
  /// [city] - новый город для установки.
  Future<void> setCity(City city);

  /// Освобождение ресурсов.
  void dispose();
}

/// Значение города по умолчанию.
const City _defaultCity = City(
  name: 'Moscow',
  localNames: {
    'ru': 'Москва',
  },
  lat: 55.7504461,
  lon: 37.6174943,
  country: 'RU',
);

/// Реализация [GeolocationRepository] с использованием [GeolocationSharedStorage].
class _GeolocationRepository with GeolocationSharedStorage implements GeolocationRepository {
  @override
  final SharedStorage storage;

  /// Поведенческий субъект для хранения текущего города.
  final BehaviorSubject<City> _citySubject = BehaviorSubject.seeded(_defaultCity);

  /// Конструктор [_GeolocationRepository].
  _GeolocationRepository(this.storage);

  @override
  City get city => _citySubject.value;

  @override
  Stream<City> get cityStream => _citySubject;

  @override
  Future<void> init() async {
    final city = getCity();

    if (city == null) {
      _citySubject.add(_defaultCity);
      return;
    }

    _citySubject.add(city);
  }

  @override
  Future<void> setCity(City city) async {
    final saved = await saveCity(city);

    if (saved) {
      _citySubject.add(city);
    }
  }

  @override
  void dispose() {
    _citySubject.close();
  }
}
