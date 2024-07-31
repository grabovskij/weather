import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/app_theme_configuration.dart';
import 'package:weather/configuration/theme/colors/app_theme_color_type.dart';
import 'package:weather/core/di/dependency_scope.dart';
import 'package:weather/core/di/repository_scope.dart';
import 'package:weather/features/home/home_screen.dart';

void main() {
  runZonedGuarded(
    () => runApp(const MyApp()),
    (error, stack) {},
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DependencyScope(
      child: RepositoryScope(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: AppThemeConfiguration.create(AppThemeType.snowy1),
          home: const HomeScreen(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
