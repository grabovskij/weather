// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherDataImpl _$$WeatherDataImplFromJson(Map<String, dynamic> json) =>
    _$WeatherDataImpl(
      dt: (json['dt'] as num?)?.toInt() ?? 0,
      main: json['main'] == null
          ? const Main()
          : Main.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
              ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      clouds: json['clouds'] == null
          ? const Clouds()
          : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      wind: json['wind'] == null
          ? const Wind()
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      visibility: (json['visibility'] as num?)?.toInt() ?? 0,
      pop: (json['pop'] as num?)?.toDouble() ?? 0,
      sys: json['sys'] == null
          ? const Sys()
          : Sys.fromJson(json['sys'] as Map<String, dynamic>),
      dtTxt: json['dt_txt'] as String? ?? '',
      rain: json['rain'] == null
          ? null
          : Rain.fromJson(json['rain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherDataImplToJson(_$WeatherDataImpl instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'wind': instance.wind,
      'visibility': instance.visibility,
      'pop': instance.pop,
      'sys': instance.sys,
      'dt_txt': instance.dtTxt,
      'rain': instance.rain,
    };
