import 'package:flutter/material.dart';

class LightTheme {
  final lightColor = LightColor();

  late final ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
      ),
      scaffoldBackgroundColor: lightColor._appBackgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: lightColor.finshBoy),
      ),
      textTheme:
          ThemeData.light().textTheme.copyWith(subtitle1: TextStyle(fontSize: 25, color: lightColor.mediEvalBlue)),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 236, 236, 236),
          ),
        ),
        focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: lightColor.finshBoy,
          ),
        ),
      ),
    );
  }
}

class LightColor {
  final Color _appBackgroundColor = Color(0xffddf1fa);
  final Color finshBoy = Color(0xff0dd7de);
  final Color mediEvalBlue = Color(0xff2e3a5a);
}
