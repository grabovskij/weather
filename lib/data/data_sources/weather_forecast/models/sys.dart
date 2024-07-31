import 'package:freezed_annotation/freezed_annotation.dart';

part 'sys.freezed.dart';
part 'sys.g.dart';

@freezed
class Sys with _$Sys {
  const factory Sys({
    @Default('') String pod,
  }) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}
