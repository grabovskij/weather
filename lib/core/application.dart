import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/mixins/theme_provider_state_mixin.dart';
import 'package:weather/core/mixin/application_initialize_state_mixin.dart';
import 'package:weather/features/home/screens/home_screen.dart';

class Application extends StatefulWidget {
  const Application({
    super.key,
  });

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> with ApplicationInitializeStateMixin, ThemeProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const HomeScreen(),
    );
  }
}
