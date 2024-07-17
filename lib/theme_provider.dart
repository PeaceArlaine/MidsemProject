import 'package:flutter/material.dart';
import 'preferences_service.dart';

class ThemeProvider with ChangeNotifier {
  final PreferencesService _preferencesService;

  ThemeProvider(this._preferencesService) {
    _themeData = _preferencesService.themeMode == ThemeMode.dark
        ? ThemeData.dark()
        : ThemeData.light();
  }

  late ThemeData _themeData;
  ThemeData get themeData => _themeData;

  void toggleTheme(bool isDarkMode) {
    _themeData = isDarkMode ? ThemeData.dark() : ThemeData.light();
    _preferencesService.setThemeMode(
      isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
    notifyListeners();
  }
}
