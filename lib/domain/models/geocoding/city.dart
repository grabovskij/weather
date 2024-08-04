import 'package:equatable/equatable.dart';

/// Модель для представления информации о городе
class City extends Equatable {
  /// Название города
  final String name;

  /// Локальные названия города на разных языках
  final Map<String, String> localNames;

  /// Широта города
  final double lat;

  /// Долгота города
  final double lon;

  /// Страна, в которой находится город
  final String country;

  /// Штат или регион, в котором находится город (если применимо)
  final String? state;

  const City({
    required this.name,
    required this.localNames,
    required this.lat,
    required this.lon,
    required this.country,
    this.state,
  });

  /// Фабричный метод для создания объекта City из JSON
  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'],
      localNames: Map<String, String>.from(json['local_names']),
      lat: json['lat'],
      lon: json['lon'],
      country: json['country'],
      state: json['state'],
    );
  }

  /// Метод для преобразования объекта City в JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'local_names': localNames,
      'lat': lat,
      'lon': lon,
      'country': country,
      'state': state,
    };
  }

  @override
  List<Object?> get props => [name, localNames, lat, lon, country, state];
}
