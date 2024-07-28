import 'package:weather/data/weather_forecast/mappers/clouds_mapper.dart';
import 'package:weather/data/weather_forecast/mappers/main_weather_info_mapper.dart';
import 'package:weather/data/weather_forecast/mappers/sys_mapper.dart';
import 'package:weather/data/weather_forecast/mappers/weather_mapper.dart';
import 'package:weather/data/weather_forecast/mappers/wind_mapper.dart';
import 'package:weather/data/weather_forecast/models/weather_data.dart'
    as transfer_object;
import 'package:weather/domain/models/weather_data.dart';

extension WeatherDatasMapper on List<transfer_object.WeatherData> {
  List<WeatherData> toEntity() {
    return map((e) => e.toEntity()).toList(growable: false);
  }
}

extension WeatherDataMapper on transfer_object.WeatherData {
  WeatherData toEntity() {
    return WeatherData(
      dt: dt,
      main: main.toEntity(),
      weather: weather.toEntity(),
      clouds: clouds.toEntity(),
      wind: wind.toEntity(),
      visibility: visibility,
      pop: pop,
      sys: sys.toEntity(),
      dtTxt: dtTxt,
    );
  }
}
