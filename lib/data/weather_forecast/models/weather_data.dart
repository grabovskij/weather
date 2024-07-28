import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/data/weather_forecast/models/clouds.dart';
import 'package:weather/data/weather_forecast/models/main.dart';
import 'package:weather/data/weather_forecast/models/rain.dart';
import 'package:weather/data/weather_forecast/models/sys.dart';
import 'package:weather/data/weather_forecast/models/weather.dart';
import 'package:weather/data/weather_forecast/models/wind.dart';

part 'weather_data.freezed.dart';
part 'weather_data.g.dart';

@freezed
class WeatherData with _$WeatherData {
  const factory WeatherData({
    @Default(0) int dt,
    @Default(Main()) Main main,
    @Default([]) List<Weather> weather,
    @Default(Clouds()) Clouds clouds,
    @Default(Wind()) Wind wind,
    @Default(0) int visibility,
    @Default(0) double pop,
    @Default(Sys()) Sys sys,
    @Default('') @JsonKey(name: 'dt_txt') String dtTxt,
    Rain? rain,
  }) = _WeatherData;

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
}
