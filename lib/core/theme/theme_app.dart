import 'package:flutter/material.dart';
import 'package:se7ety/core/theme/color_app.dart';

class ThemeApp {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Cairo",
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorApp.primery,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "Cairo",
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorApp.white,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
