import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.orange,
  Colors.pink,
];

class AppTheme {

    final int selectedColor;
    final bool isDarkMode;

    AppTheme({
      this.selectedColor = 0,
      this.isDarkMode = false
    }): assert( selectedColor >= 0, 'Selected color must be greater than 0' ),
      assert( selectedColor < colorList.length, 'Selected color must be less than clorList' );

    ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[ selectedColor ],
      appBarTheme: const AppBarTheme(
        centerTitle: false
      )
    );

    AppTheme copyWith({
      int? selectedColor,
      bool? isDarkMode
    }) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode
    );

}