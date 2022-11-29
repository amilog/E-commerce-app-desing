import 'package:flutter/material.dart';

class LightTheme {
  final lightColor = LightColor();

  late final ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      appBarTheme: const AppBarTheme(
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
          borderSide: const BorderSide(
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
  final Color _appBackgroundColor = const Color(0xffddf1fa);
  final Color finshBoy = const Color(0xff0dd7de);
  final Color mediEvalBlue = const Color(0xff2e3a5a);
}
