import 'package:flutter/material.dart';
import 'package:pasarTani/pages/sign-up/body-complete-signUp.dart';
//import 'package:pasarTani/pages/sign-up/body-signUp.dart';

class CompleteSignUpScreen extends StatelessWidget {
  static String routeName = "/complete_signUp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: BodyCompleteSignUp(),
    );
  }
}