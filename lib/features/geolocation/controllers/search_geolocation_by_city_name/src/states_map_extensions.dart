import 'package:weather/features/geolocation/controllers/search_geolocation_by_city_name/src/states.dart';

/// Расширение для класса [SearchGeolocationState], предоставляющее метод для маппинга состояний.
extension SearchGeolocationStateMapExtension on SearchGeolocationState {
  /// Метод для обработки различных состояний поиска геолокации.
  ///
  /// [orElse] - функция, которая будет вызвана, если состояние не совпадает с
  /// другими указанными состояниями или соответствующая функция для состояния
  /// не предоставлена.
  /// [onLoadedState] - функция, которая будет вызвана, если состояние является [SearchGeolocationLoadedState].
  /// [onLoadingState] - функция, которая будет вызвана, если состояние является [SearchGeolocationLoadingState].
  /// [onErrorState] - функция, которая будет вызвана, если состояние является [SearchGeolocationErrorState].
  ///
  /// Возвращает значение типа [T], в зависимости от текущего состояния.
  T mapOrElse<T>({
    required T Function() orElse,
    T Function(SearchGeolocationLoadedState state)? onLoadedState,
    T Function()? onLoadingState,
    T Function()? onErrorState,
  }) {
    final state = this;

    if (state is SearchGeolocationLoadedState && onLoadedState != null) {
      return onLoadedState(state);
    }

    if (state is SearchGeolocationLoadingState && onLoadingState != null) {
      return onLoadingState();
    }

    if (state is SearchGeolocationErrorState && onErrorState != null) {
      return onErrorState();
    }

    return orElse();
  }
}
