import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  // Private variable to store the theme mode
  bool _isLightTheme = true;

  // Getter to check if the current theme is light
  bool get isLightTheme => _isLightTheme;

  // Method to toggle the theme
  void toggleTheme() {
    _isLightTheme = !_isLightTheme;
    notifyListeners();  // Notify listeners to update the UI
  }
}
