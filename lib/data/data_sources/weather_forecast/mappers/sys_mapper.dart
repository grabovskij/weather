import 'package:weather/data/data_sources/weather_forecast/models/sys.dart' as transfer_object;
import 'package:weather/domain/models/weather_forecast/sys.dart';

extension SysMapper on transfer_object.Sys {
  Sys toEntity() {
    return Sys(pod: pod);
  }
}
