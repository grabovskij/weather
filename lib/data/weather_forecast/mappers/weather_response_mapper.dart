import 'package:weather/data/weather_forecast/mappers/city_mapper.dart';
import 'package:weather/data/weather_forecast/mappers/weather_data_mapper.dart';
import 'package:weather/data/weather_forecast/models/weather_response.dart'
    as transfer_object;
import 'package:weather/domain/models/weather_response.dart';

extension WeatherResponseMapper on transfer_object.WeatherResponse {
  WeatherResponse toEntity() {
    return WeatherResponse(
      cod: cod,
      message: message,
      cnt: cnt,
      list: list.toEntity(),
      city: city.toEntity(),
    );
  }
}
