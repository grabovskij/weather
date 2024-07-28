import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/data/weather_forecast/models/coord.dart';

part 'city.freezed.dart';
part 'city.g.dart';

@freezed
class City with _$City {
  const factory City({
    @Default(0) int id,
    @Default('') String name,
    @Default(Coord()) Coord coord,
    @Default('') String country,
    @Default(0) int population,
    @Default(0) int timezone,
    @Default(0) int sunrise,
    @Default(0) int sunset,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
