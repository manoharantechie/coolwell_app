import 'package:flutter/material.dart';

enum MyThemeKeys {
  LIGHT,
  DARK,
}

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
      primaryColor:Color(0xFF01081E),
      backgroundColor: Color(0xFFF2F2F2),
      brightness: Brightness.light,
      disabledColor: Color(0xFF8B9CAE),
      accentColor: Color(0xFFB8B8B8),
      bottomAppBarColor: Color(0xFF000000),
      canvasColor: Color(0xFF848484),
      cardColor: Color(0xFF136E82),
      dividerColor: Color(0xFFEBEBEB),
      buttonColor: Color(0xFF136E82),
      // cursorColor: Color(0xFFFFFFFF),
      splashColor: Color(0xFFE8E8E8),
      focusColor: Color(0xFFFFFFFF),
      highlightColor: Color(0xFF8B9CAE),
      errorColor: Color(0xFFDD2942),
      hintColor: Color(0xFF202020),
      hoverColor: Color(0xFF77838F),
      secondaryHeaderColor:Color(0xFFFFFFFF),
      indicatorColor: Color(0xFF1ABC7B),
      selectedRowColor: Color(0xFFFAAD34),
      scaffoldBackgroundColor: Color(0xFFDD2942)
  );


  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color(0xFF01081E),
      backgroundColor: Color(0xFFF2F2F2),
      disabledColor: Color(0xFF8B9CAE),
      focusColor: Color(0xFFFFFFFF),
      accentColor: Color(0xFFB8B8B8),
      bottomAppBarColor: Color(0xFF000000),
      canvasColor: Color(0xFF848484),
      cardColor: Color(0xFF014958),
      dividerColor: Color(0xFFEBEBEB),
      // cursorColor: Color(0xFF0e1839),
      buttonColor: Color(0xFF00C4C3),
      secondaryHeaderColor: Color(0xFF1A94AE),
      splashColor: Color(0xFFE8E8E8),
      highlightColor: Color(0xFFF7F7F7),
      errorColor: Color(0xFFffffff),
      hintColor: Color(0xFF202020),
      hoverColor: Color(0xFF77838F),
      indicatorColor: Color(0xFF1ABC7B),
      selectedRowColor: Color(0xFFFAAD34),
      scaffoldBackgroundColor: Color(0xFFDD2942)
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
