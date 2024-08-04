import 'package:weather/domain/models/geocoding/city.dart';

/// Базовый класс для состояния поиска геолокации.
sealed class SearchGeolocationState {}

/// Начальное состояние поиска геолокации.
class SearchGeolocationInitialState extends SearchGeolocationState {}

/// Состояние загрузки поиска геолокации.
class SearchGeolocationLoadingState extends SearchGeolocationState {}

/// Состояние ошибки при поиске геолокации.
class SearchGeolocationErrorState extends SearchGeolocationState {}

/// Состояние успешной загрузки результатов поиска геолокации.
class SearchGeolocationLoadedState extends SearchGeolocationState {
  /// Список найденных городов.
  final List<City> cities;

  /// Конструктор для [SearchGeolocationLoadedState].
  SearchGeolocationLoadedState(this.cities);
}
