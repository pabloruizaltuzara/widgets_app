import 'package:flutter/material.dart';
const colorList =<Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];
class AppTheme{
  final int selectedColor;
  AppTheme({
    this.selectedColor = 0
  }): assert(
    selectedColor >= 0 , 'Color debe ser mayor o igual a cero'
  ),
  assert(
  selectedColor < colorList.length , 'Color debe ser menor a ${colorList.length - 1}'
  );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );

}