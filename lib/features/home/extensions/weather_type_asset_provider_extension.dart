import 'package:weather/core/constants/asset_weather_icons.dart';
import 'package:weather/domain/enums/weather_type.dart';

extension WeatherTypeAssetProvider on WeatherType {
  String get weatherIconAssetPath {
    return switch (this) {
      WeatherType.clearSky => AssetWeatherIcons.clearSkyIconAsset,
      WeatherType.fewClouds => AssetWeatherIcons.fewCloudsIconAsset,
      WeatherType.scatteredClouds => AssetWeatherIcons.scatteredCloudsIconAsset,
      WeatherType.brokenClouds => AssetWeatherIcons.brokenCloudsIconAsset,
      WeatherType.showerRain => AssetWeatherIcons.showerRainIconAsset,
      WeatherType.rain => AssetWeatherIcons.rainIconAsset,
      WeatherType.thunderstorm => AssetWeatherIcons.thunderstormIconAsset,
      WeatherType.snow => AssetWeatherIcons.snowIconAsset,
      WeatherType.mist => AssetWeatherIcons.mistIconAsset,
    };
  }
}
