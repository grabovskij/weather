import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/app_theme_configuration.dart';
import 'package:weather/configuration/theme/colors/app_theme_color_type.dart';
import 'package:weather/core/di/dependency_scope.dart';
import 'package:weather/core/di/repository_scope.dart';
import 'package:weather/core/mixin/application_initialize_state_mixin.dart';
import 'package:weather/features/home/home_screen.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> with ApplicationInitializeStateMixin {
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
