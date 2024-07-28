import 'package:weather/data/weather_forecast/models/sys.dart'
    as transfer_object;
import 'package:weather/domain/models/sys.dart';

extension SysMapper on transfer_object.Sys {
  Sys toEntity() {
    return Sys(pod: pod);
  }
}
