import 'package:weather/data/weather_forecast/models/clouds.dart'
    as transfer_object;
import 'package:weather/domain/models/clouds.dart';

extension CloudsMapper on transfer_object.Clouds {
  Clouds toEntity() {
    return Clouds(all: all);
  }
}
