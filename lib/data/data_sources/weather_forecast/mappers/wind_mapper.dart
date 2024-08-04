import 'package:weather/data/data_sources/weather_forecast/models/wind.dart' as transfer_object;
import 'package:weather/domain/models/weather_forecast/wind.dart';

extension WindMapper on transfer_object.Wind {
  Wind toEntity() {
    return Wind(
      speed: speed,
      deg: deg,
      gust: gust,
    );
  }
}
