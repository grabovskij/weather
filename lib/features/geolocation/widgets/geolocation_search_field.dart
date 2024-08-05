import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/extensions/context_theme_extensions.dart';
import 'package:weather/core/extensions/context_scope_extension.dart';
import 'package:weather/features/geolocation/controllers/search_geolocation_by_city_name/controller.dart';
import 'package:weather/features/geolocation/widgets/geolocation_search_result_overlay.dart';
import 'package:weather/ui/mixins/overlay_builder_state_mixin.dart';

class GeolocationSearchField extends StatefulWidget {
  const GeolocationSearchField({super.key});

  @override
  State<GeolocationSearchField> createState() => _GeolocationSearchFieldState();
}

class _GeolocationSearchFieldState extends State<GeolocationSearchField> with OverlayBuilderStateMixin {
  late final SearchGeolocationByCityNameController _searchGeolocationController;
  late final StreamSubscription<SearchGeolocationState> _stateSubscription;

  @override
  Size get overlaySize {
    return _searchGeolocationController.state.mapOrElse(
      onLoadedState: (state) => Size(
        MediaQuery.sizeOf(context).width - 32,
        (state.cities.length * 60).clamp(0, 200).toDouble(),
      ),
      orElse: () => Size.zero,
    );
  }

  @override
  Offset get offset => const Offset(16, -8);

  @override
  OverlayBuilder get overlayBuilder {
    return (context, hide) {
      return _searchGeolocationController.state.mapOrElse(
        onLoadedState: (state) => GeolocationSearchResultOverlay(
          cities: state.cities,
          hide: hide,
        ),
        orElse: () => const SizedBox.shrink(),
      );
    };
  }

  @override
  void initState() {
    super.initState();
    _searchGeolocationController = SearchGeolocationByCityNameController(dataSource: context.read());
    _stateSubscription = _searchGeolocationController.stateStream.listen(onChangeState);
  }

  @override
  void dispose() {
    _stateSubscription.cancel();
    _searchGeolocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: TapRegion(
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        child: RepaintBoundary(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              style: context.textStyles.bodyMedium,
              onChanged: (value) => _searchGeolocationController.search(value.trim()),
              decoration: InputDecoration(
                filled: true,
                hintText: 'Город',
                hintStyle: context.textStyles.bodyMedium,
                fillColor: context.colors.secondary.withOpacity(0.35),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: context.colors.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: context.colors.primary, width: 2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onChangeState(SearchGeolocationState state) {
    state.mapOrElse(
      onLoadedState: (_) => show(),
      orElse: hide,
    );
  }
}
