import 'package:flutter/material.dart';
import 'package:pasarTani/pages/sign-in/body-sign-in.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Sign In"),
      ),
      body: BodySignIn(),
    );
  }
}