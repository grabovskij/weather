import 'package:rxdart/rxdart.dart';
import 'package:weather/core/utils/debouncer.dart';
import 'package:weather/data/data_sources/geocoding/geocoding.dart';
import 'package:weather/features/geolocation/controllers/search_geolocation_by_city_name/src/states.dart';

/// Контроллер для поиска геолокации по названию города.
class SearchGeolocationByCityNameController {
  /// Дебаунсер для уменьшения количества запросов.
  final Debouncer _debouncer;

  /// Источник данных для геокодирования.
  final GeocodingDataSource _dataSource;

  /// Поведенческий субъект для управления состояниями поиска геолокации.
  final BehaviorSubject<SearchGeolocationState> _stateSubject;

  /// Предыдущий запрос.
  String? _previousQuery;

  /// Конструктор для [SearchGeolocationByCityNameController].
  ///
  /// [dataSource] - источник данных для геокодирования.
  SearchGeolocationByCityNameController({required GeocodingDataSource dataSource})
      : _dataSource = dataSource,
        _debouncer = Debouncer(const Duration(milliseconds: 450)),
        _stateSubject = BehaviorSubject.seeded(SearchGeolocationInitialState());

  /// Текущее состояние поиска геолокации.
  SearchGeolocationState get state => _stateSubject.value;

  /// Поток состояний поиска геолокации.
  Stream<SearchGeolocationState> get stateStream => _stateSubject;

  /// Поиск геолокации по названию города.
  ///
  /// [query] - название города для поиска.
  /// [limit] - максимальное количество результатов (по умолчанию 20).
  void search(String query, {int limit = 20}) {
    _debouncer.debounce(() {
      if (query.isEmpty) {
        return;
      }

      if (query == _previousQuery) {
        return;
      }

      _previousQuery = query;

      _stateSubject.add(SearchGeolocationLoadingState());

      _dataSource
          .coordinatesByLocationName(query, limit: limit)
          .then((cities) => _stateSubject.add(SearchGeolocationLoadedState(cities)))
          .onError((_, __) => _stateSubject.add(SearchGeolocationErrorState()));
    });
  }

  /// Сброс состояния поиска геолокации.
  void reset() {
    _stateSubject.add(SearchGeolocationInitialState());
  }

  /// Освобождение ресурсов.
  void dispose() {
    _debouncer.dispose();
    _stateSubject.close();
  }
}
