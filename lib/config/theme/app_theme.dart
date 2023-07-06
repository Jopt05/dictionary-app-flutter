
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const List<Color> colorList = [
  Colors.purple,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.orange,
];

class AppTheme {
  
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 1,
    this.isDarkMode = false,
  }): assert(
    selectedColor >= 0 && selectedColor <= colorList.length - 1,
    'Colors must be higher than 0 and less than ${ (colorList.length - 1).toString() }'
  );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    ),
  );

  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode
  }) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode
  );

}