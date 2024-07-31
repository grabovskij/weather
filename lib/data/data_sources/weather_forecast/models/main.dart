import 'package:freezed_annotation/freezed_annotation.dart';

part 'main.freezed.dart';
part 'main.g.dart';

@freezed
class Main with _$Main {
  const factory Main({
    @Default(0) double temp,
    @Default(0) @JsonKey(name: 'feels_like') double feelsLike,
    @Default(0) @JsonKey(name: 'temp_min') double tempMin,
    @Default(0) @JsonKey(name: 'temp_max') double tempMax,
    @Default(0) int pressure,
    @Default(0) @JsonKey(name: 'sea_level') int seaLevel,
    @Default(0) @JsonKey(name: 'grnd_level') int grndLevel,
    @Default(0) int humidity,
    @Default(0) @JsonKey(name: 'temp_kf') double tempKf,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}
