import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService with ChangeNotifier {
  static const _themeModeKey = 'themeMode';
  static const _sortKey = 'sortPreference';

  late SharedPreferences _preferences;

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  String _sortPreference = 'title';
  String get sortPreference => _sortPreference;

  PreferencesService() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    _themeMode = ThemeMode.values[_preferences.getInt(_themeModeKey) ?? 0];
    _sortPreference = _preferences.getString(_sortKey) ?? 'title';
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await _preferences.setInt(_themeModeKey, mode.index);
    notifyListeners();
  }

  Future<void> setSortPreference(String sortPreference) async {
    _sortPreference = sortPreference;
    await _preferences.setString(_sortKey, sortPreference);
    notifyListeners();
  }
}
