import 'package:weather/data/repository/weather_forecast/weather_forecast_repository.dart';
import 'package:weather/domain/models/weather_forecast/weather_data.dart';

WeatherData extractCurrentWeather(WeatherForecastLoadedState e) {
  final weatherDataSet = e.weatherResponse.list;

  var minimalDeltaTime = weatherDataSet.first.dateTime.difference(DateTime.now()).inSeconds.abs();
  var targetWeatherData = weatherDataSet.first;

  weatherDataSet.forEach((WeatherData weatherData) {
    final dataDeltaTime = weatherData.dateTime.difference(DateTime.now()).inSeconds.abs();

    if (minimalDeltaTime > dataDeltaTime) {
      minimalDeltaTime = dataDeltaTime;
      targetWeatherData = weatherData;
    }
  });

  return targetWeatherData;
}
