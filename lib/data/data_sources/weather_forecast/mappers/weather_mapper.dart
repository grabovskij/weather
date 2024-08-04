import 'package:weather/data/data_sources/weather_forecast/models/weather.dart' as transfer_object;
import 'package:weather/domain/models/weather_forecast/weather.dart';

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
