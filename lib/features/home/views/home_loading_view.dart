import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/extensions/context_theme_extensions.dart';
import 'package:weather/features/loading/widgets/loading_animation.dart';

class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: context.colors.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: LoadingAnimation(color: context.colors.primary),
          ),
        ),
      ),
    );
  }
}
