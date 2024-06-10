import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF00FF00);

const List<Color> _colorThemes = [
  _customColor,
  Color(0xFF00FF00),
  Color(0xFF0000FF),
  Color(0xFFFF0000),
  Color(0xFFFFFF00),
  Color(0xFF00FFFF),
  Color(0xFFFF00FF),
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }): assert(selectedColor >= 0 && selectedColor < _colorThemes.length -1 , 'Invalid color index');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      //brightness: Brightness.dark
    );
  }
}
