import 'package:freezed_annotation/freezed_annotation.dart';

part 'rain.freezed.dart';
part 'rain.g.dart';

@freezed
class Rain with _$Rain {
  const factory Rain({
    @Default(0) @JsonKey(name: '3h') double the3H,
  }) = _Rain;

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);
}
