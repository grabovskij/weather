import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/app_theme_configuration.dart';
import 'package:weather/configuration/theme/app_theme_type.dart';
import 'package:weather/core/mixin/application_initialize_state_mixin.dart';
import 'package:weather/features/home/screens/home_screen.dart';

class Application extends StatefulWidget {
  const Application({
    super.key,
  });

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> with ApplicationInitializeStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeConfiguration.create(AppThemeType.sunny2),
      home: const HomeScreen(),
    );
  }
}
