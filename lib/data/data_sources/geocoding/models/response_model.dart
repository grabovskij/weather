import 'package:equatable/equatable.dart';
import 'package:weather/data/data_sources/geocoding/models/city_model.dart';

class ResponseModel extends Equatable {
  final List<CityModel> cities;

  const ResponseModel(this.cities);

  factory ResponseModel.fromJsons(List<dynamic> jsons) {
    final cities = jsons.map((e) => CityModel.fromJson(e)).toList(growable: false);

    return ResponseModel(cities);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [cities];
}
