import 'package:flutter/cupertino.dart';
import 'package:weather/core/utils/app_string_format.dart';

mixin ApplicationInitializeStateMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    AppStringFormat.init();
  }
}
