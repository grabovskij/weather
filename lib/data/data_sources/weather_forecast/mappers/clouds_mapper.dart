import 'package:weather/data/data_sources/weather_forecast/models/clouds.dart' as transfer_object;
import 'package:weather/domain/models/weather_forecast/clouds.dart';

extension CloudsMapper on transfer_object.Clouds {
  Clouds toEntity() {
    return Clouds(all: all);
  }
}
