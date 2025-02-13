import 'package:flutter/material.dart';

const seedcolor = Color.fromARGB(255, 7, 80, 59);

class AppTheme {
  final bool isDarkMode;

  AppTheme({required this.isDarkMode});

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedcolor,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      listTileTheme: const ListTileThemeData(iconColor: seedcolor),
      );
}
