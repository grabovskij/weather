import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

@freezed
class CityModel with _$CityModel {
  const factory CityModel({
    @Default('') String name,
    @Default({}) @JsonKey(name: 'local_names') Map<String, String> localNames,
    @Default(0) double lat,
    @Default(0) double lon,
    @Default('') String country,
    String? state,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);
}
