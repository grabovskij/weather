import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/data/weather_forecast/models/city.dart';
import 'package:weather/data/weather_forecast/models/weather_data.dart';

part 'weather_response.freezed.dart';
part 'weather_response.g.dart';

@freezed
class WeatherResponse with _$WeatherResponse {
  const factory WeatherResponse({
    @Default('200') String cod,
    @Default(0) int message,
    @Default(0) int cnt,
    @Default([]) List<WeatherData> list,
    @Default(City()) City city,
  }) = _WeatherResponse;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}
