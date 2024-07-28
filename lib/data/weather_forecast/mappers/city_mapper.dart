import 'package:weather/data/weather_forecast/mappers/coordinates_mapper.dart';
import 'package:weather/data/weather_forecast/models/city.dart'
    as transfer_object;
import 'package:weather/domain/models/city.dart';

extension CityMapper on transfer_object.City {
  City toEntity() {
    return City(
      id: id,
      name: name,
      coord: coord.toEntity(),
      country: country,
      population: population,
      timezone: timezone,
      sunrise: sunrise,
      sunset: sunset,
    );
  }
}
