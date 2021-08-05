import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    buttonColor: Colors.blue,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Colors.blue),
      checkColor: MaterialStateProperty.all(Colors.white)
    )
  );

  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    buttonColor: Colors.red,
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(Colors.red),
          checkColor: MaterialStateProperty.all(Colors.white)
      )
  );
}