import 'package:weather/data/weather_forecast/models/wind.dart'
    as transfer_object;
import 'package:weather/domain/models/wind.dart';

extension WindMapper on transfer_object.Wind {
  Wind toEntity() {
    return Wind(
      speed: speed,
      deg: deg,
      gust: gust,
    );
  }
}
