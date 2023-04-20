import 'package:flutter/material.dart';

enum MyThemeKeys {
  LIGHT,
  DARK,
}

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xFF000000),
      backgroundColor: Color(0xFFF7F7F7),
      disabledColor: Color(0xFFFF0000),
      focusColor: Color(0xFFFFFFFF),
      accentColor: Color(0xFFB8B8B8),
      bottomAppBarColor: Color(0xFF999999),
      canvasColor: Color(0xFF848484),
      cardColor: Color(0xFF0FABFF),
      dividerColor: Color(0xFFEBEBEB),
      // cursorColor: Color(0xFF0e1839),
      buttonColor: Color(0xFF1639FF),
      secondaryHeaderColor: Color(0xFFB2B3B4),
      splashColor: Color(0xFFE8E8E8),
      highlightColor: Color(0xFFF7F7F7),
      errorColor: Color(0xFFFFEC40),
      hintColor: Color(0xFF78AAF4),
      hoverColor: Color(0xFFFBBC05),
      indicatorColor: Color(0xFF90D272),
      selectedRowColor: Color(0xFF34A853),
      scaffoldBackgroundColor: Color(0xFFF1F1F1)
  );


  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color(0xFF000000),
      backgroundColor: Color(0xFFF7F7F7),
      disabledColor: Color(0xFFFF0000),
      focusColor: Color(0xFFFFFFFF),
      accentColor: Color(0xFFB8B8B8),
      bottomAppBarColor: Color(0xFF999999),
      canvasColor: Color(0xFF848484),
      cardColor: Color(0xFF0FABFF),
      dividerColor: Color(0xFFEBEBEB),
      // cursorColor: Color(0xFF0e1839),
      buttonColor: Color(0xFF1639FF),
      secondaryHeaderColor: Color(0xFFB2B3B4),
      splashColor: Color(0xFFE8E8E8),
      highlightColor: Color(0xFFF7F7F7),
      errorColor: Color(0xFFFFEC40),
      hintColor: Color(0xFF78AAF4),
      hoverColor: Color(0xFFFBBC05),
      indicatorColor: Color(0xFF90D272),
      selectedRowColor: Color(0xFF34A853),
      scaffoldBackgroundColor: Color(0xFFF1F1F1)
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHT:
        return lightTheme;
      case MyThemeKeys.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
