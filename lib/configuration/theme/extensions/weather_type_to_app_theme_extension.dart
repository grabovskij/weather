import 'package:weather/configuration/theme/app_theme_type.dart';
import 'package:weather/domain/enums/weather_type.dart';

extension WeatherTypeToAppThemeType on WeatherType {
  /// Преобразует [WeatherType] в [AppThemeType].
  ///
  /// Возвращает соответствующее значение [AppThemeType] для данного [WeatherType].
  AppThemeType toAppThemeType() {
    switch (this) {
      case WeatherType.clearSky:
        return AppThemeType.sunny1;
      case WeatherType.fewClouds:
        return AppThemeType.cloudy1;
      case WeatherType.scatteredClouds:
        return AppThemeType.cloudy2;
      case WeatherType.brokenClouds:
        return AppThemeType.cloudy3;
      case WeatherType.showerRain:
        return AppThemeType.rainy1;
      case WeatherType.rain:
        return AppThemeType.rainy2;
      case WeatherType.thunderstorm:
        return AppThemeType.rainy3;
      case WeatherType.snow:
        return AppThemeType.snowy1;
      case WeatherType.mist:
        return AppThemeType.cloudy4;
      default:
        return AppThemeType.cloudy1;
    }
  }
}
