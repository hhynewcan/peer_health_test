import 'package:flutter/material.dart';
import 'package:peer_health_test/Constants.dart';
import 'package:peer_health_test/main.dart';

// Themes for the app
class ThemeProvider extends ChangeNotifier {

  ThemeMode themeMode = MyApp.isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme(bool isDarkMode) {
    themeMode = MyApp.isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Themes {

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: usaskGreen,
      appBarTheme: const AppBarTheme(
        color: usaskGreen
      ),
      colorScheme: ColorScheme.light()
  );
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      primaryColor: usaskGreen,
      appBarTheme: const AppBarTheme(
          color: usaskGreen
      ),
      colorScheme: ColorScheme.dark()
  );
}