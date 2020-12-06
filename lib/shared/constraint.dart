import 'package:flutter/material.dart';
import 'package:pasarTani/shared/size_config.dart';

//Color tPrimaryColor = "FFC700".toColor();

const primaryColor = Color(0xFF32b18f);
const primaryLightColor = Color(0xFFFFECDF);
const primaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)]);
const secondaryColor = Color(0xFF979797);
const textColor = Color(0xFF757575);
const animationDuration = Duration(microseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

const String emailNullError = "Please Enter your email";
const String invalidEmailError = "Please Enter Valid Email";
const String passNullError = "Please Enter your password";
const String shortPassError = "Password is too short";
const String matchPassError = "Passwords don't match";
const String namelNullError = "Please Enter your name";
const String phoneNumberNullError = "Please Enter your phone number";
const String addressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
    contentPadding:
        EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    border: outlineInputBorder(),
  );

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: textColor),
  );
}
