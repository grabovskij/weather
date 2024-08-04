import 'package:dio/dio.dart';
import 'package:weather/data/data_sources/geocoding/mappers/city_entity_mapper.dart';
import 'package:weather/data/data_sources/geocoding/models/response_model.dart';
import 'package:weather/domain/models/geocoding/city.dart';

class GeocodingDataSource {
  final Dio _dio;
  final String _appId;

  GeocodingDataSource({
    required Dio dio,
    required String appId,
  })  : _dio = dio,
        _appId = appId;

  Future<List<City>> coordinatesByLocationName(
    String query, {
    int? limit,
  }) async {
    final response = await _dio.get(
      'https://api.openweathermap.org/geo/1.0/direct',
      queryParameters: {
        'q': query,
        'appid': _appId,
        if (limit != null) 'limit': limit,
      },
    );

    return ResponseModel.fromJsons(response.data).toEntities();
  }
}
