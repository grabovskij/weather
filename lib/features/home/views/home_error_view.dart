import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/extensions/context_theme_extensions.dart';
import 'package:weather/core/extensions/context_scope_extension.dart';
import 'package:weather/data/repository/weather_forecast/weather_forecast_repository.dart';

class HomeErrorView extends StatelessWidget {
  const HomeErrorView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: context.colors.secondary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Что-то пошло не так...',
                style: context.textStyles.bodyMedium,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: FilledButton(
                  onPressed: context.read<WeatherForecastRepository>().init,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(context.colors.primary),
                    foregroundColor: WidgetStateProperty.all(context.colors.text),
                  ),
                  child: const Text('Повторить'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
