import 'package:weather/data/weather_forecast/models/coord.dart'
    as transfer_object;
import 'package:weather/domain/models/coordinates.dart';

extension CoordMapper on transfer_object.Coord {
  Coordinates toEntity() {
    return Coordinates(lat: lat, lon: lon);
  }
}
