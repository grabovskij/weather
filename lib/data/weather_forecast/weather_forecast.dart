import 'package:dio/dio.dart';
import 'package:weather/core/environment.dart';
import 'package:weather/data/weather_forecast/mappers/weather_response_mapper.dart';
import 'package:weather/data/weather_forecast/models/weather_response.dart'
    as transfer_object;
import 'package:weather/domain/models/weather_response.dart';

class WeatherForecastDataSource {
  final Dio _dio;

  const WeatherForecastDataSource(this._dio);

  Future<WeatherResponse> getWeather({
    required double lat,
    required double lon,
  }) async {
    final response = await _dio.get(
      'https://api.openweathermap.org/data/2.5/forecast',
      queryParameters: {
        'lat': lat,
        'lon': lat,
        'appid': Environment.appid,
        'lang': 'ru',
      },
    );

    return transfer_object.WeatherResponse.fromJson(response.data).toEntity();
  }
}
