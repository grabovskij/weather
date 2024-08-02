import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather/core/application.dart';

void main() {
  runZonedGuarded(
    () => runApp(const Application()),
    (error, stack) {},
  );
}
