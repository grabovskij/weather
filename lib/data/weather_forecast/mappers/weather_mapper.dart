import 'package:weather/data/weather_forecast/models/weather.dart'
    as transfer_object;
import 'package:weather/domain/models/weather.dart';

extension WeathersMapper on List<transfer_object.Weather> {
  List<Weather> toEntity() {
    return map((e) => e.toEntity()).toList(growable: false);
  }
}

extension WeatherMapper on transfer_object.Weather {
  Weather toEntity() {
    return Weather(
      id: id,
      main: main,
      description: description,
      icon: icon,
    );
  }
}
