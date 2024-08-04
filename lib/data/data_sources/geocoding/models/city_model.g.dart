// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityModelImpl _$$CityModelImplFromJson(Map<String, dynamic> json) =>
    _$CityModelImpl(
      name: json['name'] as String? ?? '',
      localNames: (json['local_names'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      lat: (json['lat'] as num?)?.toDouble() ?? 0,
      lon: (json['lon'] as num?)?.toDouble() ?? 0,
      country: json['country'] as String? ?? '',
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$CityModelImplToJson(_$CityModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'local_names': instance.localNames,
      'lat': instance.lat,
      'lon': instance.lon,
      'country': instance.country,
      'state': instance.state,
    };
