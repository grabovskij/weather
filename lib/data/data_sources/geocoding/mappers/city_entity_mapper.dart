import 'package:weather/data/data_sources/geocoding/models/city_model.dart';
import 'package:weather/data/data_sources/geocoding/models/response_model.dart';
import 'package:weather/domain/models/geocoding/city.dart';

extension CitiesEntityMapper on ResponseModel {
  List<City> toEntities() {
    return cities.map((c) => c.toEntity()).toList(growable: false);
  }
}

extension CityEntityMapper on CityModel {
  City toEntity() {
    return City(
      name: name,
      localNames: localNames,
      lat: lat,
      lon: lon,
      country: country,
    );
  }
}
