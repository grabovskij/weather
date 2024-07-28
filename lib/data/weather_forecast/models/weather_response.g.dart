// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherResponseImpl _$$WeatherResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherResponseImpl(
      cod: json['cod'] as String? ?? '200',
      message: (json['message'] as num?)?.toInt() ?? 0,
      cnt: (json['cnt'] as num?)?.toInt() ?? 0,
      list: (json['list'] as List<dynamic>?)
              ?.map((e) => WeatherData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      city: json['city'] == null
          ? const City()
          : City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherResponseImplToJson(
        _$WeatherResponseImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
      'city': instance.city,
    };
