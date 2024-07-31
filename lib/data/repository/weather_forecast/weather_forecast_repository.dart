import 'package:rxdart/rxdart.dart';
import 'package:weather/data/data_sources/weather_forecast/weather_forecast.dart';
import 'package:weather/domain/models/weather_response.dart';

sealed class WeatherForecastState {}

class WeatherForecastLoadingState extends WeatherForecastState {}

class WeatherForecastLoadedState extends WeatherForecastState {
  final WeatherResponse weatherResponse;

  WeatherForecastLoadedState(this.weatherResponse);
}

class WeatherForecastErrorState extends WeatherForecastState {
  final dynamic error;

  WeatherForecastErrorState(this.error);
}

class WeatherForecastRepository {
  final WeatherForecastDataSource _dataSource;
  final BehaviorSubject<WeatherForecastState> _stateSubject =
      BehaviorSubject.seeded(WeatherForecastLoadingState());

  WeatherForecastRepository(this._dataSource);

  WeatherForecastState get state => _stateSubject.value;

  Stream<WeatherForecastState> get stateStream => _stateSubject;

  Future<void> init() async {
    _stateSubject.add(WeatherForecastLoadingState());
    _dataSource
        .getWeather(lat: 55.751244, lon: 37.618423)
        .then((response) =>
            _stateSubject.add(WeatherForecastLoadedState(response)))
        .onError((e, s) => _stateSubject.add(WeatherForecastErrorState(e)));
  }

  void dispose() {
    _stateSubject.close();
  }
}
