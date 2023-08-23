import 'package:flutter/material.dart';

// import 'package:flutter/foundation.dart';
/*
SO basically what we are doing in this provider is initializing a variable which is _themeMode and
by default the theme is light. And then after that we get the value of the themeMode. Here we have 
a function in which we are setting the theme of the screen where we are going to use that theme.
 */
class ThemeChanger with ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void setTheme(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
