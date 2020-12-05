import 'package:flutter/material.dart';
import 'package:pasarTani/shared/constraint.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    //appBarTheme(header atas)
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

//input Item kolom
InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: textColor),
    gapPadding: 10,
  );

  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 42,
      vertical: 20,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
      bodyText1: TextStyle(color: textColor),
      bodyText2: TextStyle(color: textColor));
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
          headline6: TextStyle(
        color: Color(0xFF8B8B8B),
        fontSize: 18,
      )));
}
