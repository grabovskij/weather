import 'package:weather/data/weather_forecast/models/main.dart';
import 'package:weather/domain/models/main_weather_info.dart';

extension MainWeatherInfoMapper on Main {
  MainWeatherInfo toEntity() {
    return MainWeatherInfo(
      temp: temp,
      feelsLike: feelsLike,
      tempMin: tempMin,
      tempMax: tempMax,
      pressure: pressure,
      seaLevel: seaLevel,
      grndLevel: grndLevel,
      humidity: humidity,
      tempKf: tempKf,
    );
  }
}
