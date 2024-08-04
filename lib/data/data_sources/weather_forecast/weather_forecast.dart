import 'package:dio/dio.dart';
import 'package:weather/data/data_sources/weather_forecast/mappers/weather_response_mapper.dart';
import 'package:weather/data/data_sources/weather_forecast/models/language.dart';
import 'package:weather/data/data_sources/weather_forecast/models/weather_response.dart' as transfer_object;
import 'package:weather/domain/models/weather_forecast/weather_response.dart';

class WeatherForecastDataSource {
  final Dio _dio;
  final String _appId;

  const WeatherForecastDataSource(
    this._dio, {
    required String appId,
  }) : _appId = appId;

  Future<WeatherResponse> getWeather({
    required double lat,
    required double lon,
    Language language = Language.russian,
  }) async {
    final response = await _dio.get(
      'https://api.openweathermap.org/data/2.5/forecast',
      queryParameters: {
        'lat': lat,
        'lon': lon,
        'appid': _appId,
        'lang': language.code,
      },
    );

    return transfer_object.WeatherResponse.fromJson(response.data).toEntity();
  }
}
