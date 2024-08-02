import 'package:weather/core/constants/asset_weather_icons.dart';
import 'package:weather/domain/enums/weather_type.dart';

extension WeatherTypeAssetProvider on WeatherType {
  String get weatherIconAssetPath {
    return switch (this) {
      WeatherType.clearSky => AssetWeatherIcons.cloudy,
      _ => AssetWeatherIcons.cloudy,
    };
  }
}
