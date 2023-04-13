import 'dart:io';
import 'package:coolwell_app/common/localization/localizations.dart';
import 'package:coolwell_app/common/theme/custom_theme.dart';
import 'package:coolwell_app/common/theme/themes.dart';
import 'package:coolwell_app/screens/basics/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xFFF7F7F7),
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark, // status bar icon color
    systemNavigationBarIconBrightness:
        Brightness.dark, // color of navigation controls
  ));

  runApp(
    const CustomTheme(
      initialThemeKey: MyThemeKeys.DARK,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        title: "CoolWell",
        theme: CustomTheme.of(context),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('tr', ''),
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        });
  }
}
