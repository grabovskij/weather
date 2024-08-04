import 'package:weather/data/data_sources/weather_forecast/models/coord.dart' as transfer_object;
import 'package:weather/domain/models/weather_forecast/coordinates.dart';

extension CoordMapper on transfer_object.Coord {
  Coordinates toEntity() {
    return Coordinates(lat: lat, lon: lon);
  }
}
