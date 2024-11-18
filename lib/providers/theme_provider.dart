import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = _themeA; 
  String _currentFont = 'Roboto'; 
  double _fontSize = 16;
  Color _fontColor = Colors.black; 

  static final _themeA = ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.blue.shade50,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16, fontFamily: 'Roboto', color: Colors.black),
    ),
  );

  static final _themeB = ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.green.shade50,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16, fontFamily: 'Courier', color: Colors.black),
    ),
  );

  static final _themeC = ThemeData(
    primaryColor: Colors.purple,
    scaffoldBackgroundColor: Colors.purple.shade50,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16, fontFamily: 'Georgia', color: Colors.black),
    ),
  );

  ThemeData get currentTheme => _currentTheme;
  String get currentFont => _currentFont;
  double get fontSize => _fontSize;
  Color get fontColor => _fontColor;

  void changeTheme(String themeName) {
    if (themeName == 'Theme A') {
      _currentTheme = _themeA;
    } else if (themeName == 'Theme B') {
      _currentTheme = _themeB;
    } else if (themeName == 'Theme C') {
      _currentTheme = _themeC;
    }
    _updateTheme();
    notifyListeners();
  }

  void changeFont(String fontName) {
    _currentFont = fontName;
    _updateTheme();
    notifyListeners();
  }

  void changeFontSize(double newSize) {
    _fontSize = newSize;
    _updateTheme();
    notifyListeners();
  }

  void changeFontColor(Color newColor) {
    _fontColor = newColor;
    _updateTheme();
    notifyListeners();
  }

  void _updateTheme() {
    _currentTheme = _currentTheme.copyWith(
      textTheme: _currentTheme.textTheme.copyWith(
        bodyMedium: TextStyle(
          fontFamily: _currentFont,
          fontSize: _fontSize,
          color: _fontColor, 
        ),
      ),
    );
  }
}




