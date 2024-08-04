import 'package:weather/domain/enums/weather_condition_codes.dart';
import 'package:weather/domain/enums/weather_type.dart';

/// Расширение для конвертации [WeatherConditionCode] в [WeatherType].
extension WeatherConditionCodeExtension on WeatherConditionCode {
  /// Метод для преобразования [WeatherConditionCode] в [WeatherType].
  WeatherType toWeatherType() {
    switch (this) {
      case WeatherConditionCode.clearSky:
        return WeatherType.clearSky;

      case WeatherConditionCode.fewClouds:
      case WeatherConditionCode.scatteredClouds:
      case WeatherConditionCode.brokenClouds:
      case WeatherConditionCode.overcastClouds:
        return WeatherType.fewClouds;

      case WeatherConditionCode.lightIntensityShowerRain:
      case WeatherConditionCode.showerRain:
      case WeatherConditionCode.heavyIntensityShowerRain:
      case WeatherConditionCode.raggedShowerRain:
        return WeatherType.showerRain;

      case WeatherConditionCode.lightRain:
      case WeatherConditionCode.moderateRain:
      case WeatherConditionCode.heavyIntensityRain:
      case WeatherConditionCode.veryHeavyRain:
      case WeatherConditionCode.extremeRain:
      case WeatherConditionCode.freezingRain:
        return WeatherType.rain;

      case WeatherConditionCode.thunderstormWithLightRain:
      case WeatherConditionCode.thunderstormWithRain:
      case WeatherConditionCode.thunderstormWithHeavyRain:
      case WeatherConditionCode.lightThunderstorm:
      case WeatherConditionCode.thunderstorm:
      case WeatherConditionCode.heavyThunderstorm:
      case WeatherConditionCode.raggedThunderstorm:
      case WeatherConditionCode.thunderstormWithLightDrizzle:
      case WeatherConditionCode.thunderstormWithDrizzle:
      case WeatherConditionCode.thunderstormWithHeavyDrizzle:
        return WeatherType.thunderstorm;

      case WeatherConditionCode.lightSnow:
      case WeatherConditionCode.snow:
      case WeatherConditionCode.heavySnow:
      case WeatherConditionCode.sleet:
      case WeatherConditionCode.lightShowerSleet:
      case WeatherConditionCode.showerSleet:
      case WeatherConditionCode.lightRainAndSnow:
      case WeatherConditionCode.rainAndSnow:
      case WeatherConditionCode.lightShowerSnow:
      case WeatherConditionCode.showerSnow:
      case WeatherConditionCode.heavyShowerSnow:
        return WeatherType.snow;

      case WeatherConditionCode.mist:
      case WeatherConditionCode.smoke:
      case WeatherConditionCode.haze:
      case WeatherConditionCode.sandDustWhirls:
      case WeatherConditionCode.fog:
      case WeatherConditionCode.sand:
      case WeatherConditionCode.dust:
      case WeatherConditionCode.volcanicAsh:
      case WeatherConditionCode.squalls:
      case WeatherConditionCode.tornado:
        return WeatherType.mist;

      default:
        return WeatherType.clearSky;
    }
  }
}
