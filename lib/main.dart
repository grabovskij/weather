import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather/core/application.dart';
import 'package:weather/core/di/app_scope.dart';
import 'package:weather/core/di/dependency.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      await Dependency.init(widgetsBinding);

      runApp(const AppScope(child: Application()));
    },
    (error, stack) {},
  );
}
