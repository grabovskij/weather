import 'package:flutter/material.dart';

const _fontFamily = 'poppins';

abstract class TextStyles {
  static TextStyle displayLarge(Color color) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 100,
      color: color,
    );
  }

  static TextStyle headlineLarge(Color color) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: 25,
      color: color,
    );
  }

  static TextStyle headlineMedium(Color color) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: color,
    );
  }

  static TextStyle bodyMedium(Color color) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: 15,
      color: color,
    );
  }
}
