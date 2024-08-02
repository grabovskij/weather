import 'package:weather/domain/models/city.dart';

extension CityDataTimeParser on City {
  DateTime get sunsetDataTime => DateTime.fromMillisecondsSinceEpoch(sunset, isUtc: true);

  DateTime get sunriseDataTime => DateTime.fromMillisecondsSinceEpoch(sunrise, isUtc: true);
}
