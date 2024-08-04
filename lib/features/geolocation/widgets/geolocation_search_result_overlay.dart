import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/extensions/context_theme_extensions.dart';
import 'package:weather/core/extensions/context_scope_extension.dart';
import 'package:weather/data/repository/geolocation/geolocation_repository.dart';
import 'package:weather/domain/models/geocoding/city.dart';

class GeolocationSearchResultOverlay extends StatelessWidget {
  final VoidCallback hide;
  final List<City> cities;

  const GeolocationSearchResultOverlay({
    required this.cities,
    required this.hide,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final geolocationRepository = context.read<GeolocationRepository>();

    return TapRegion(
      onTapOutside: (_) => hide(),
      child: Material(
        type: MaterialType.transparency,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colors.secondary,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: context.colors.primary),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: cities.length,
              itemBuilder: (context, index) {
                final city = cities[index];
                final title = '${city.localNames['ru'] ?? city.name} (${city.country})';

                return InkWell(
                  onTap: () {
                    geolocationRepository.setCity(city);
                    hide();
                  },
                  child: Text(
                    title,
                    style: context.textStyles.bodyMedium,
                    textHeightBehavior: const TextHeightBehavior(
                      applyHeightToFirstAscent: false,
                      applyHeightToLastDescent: false,
                      leadingDistribution: TextLeadingDistribution.even,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(color: context.colors.text.withOpacity(0.35));
              },
            ),
          ),
        ),
      ),
    );
  }
}
