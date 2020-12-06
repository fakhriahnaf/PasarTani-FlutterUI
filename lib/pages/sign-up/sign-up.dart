import 'package:flutter/material.dart';
import 'package:pasarTani/pages/sign-up/body-signUp.dart';


class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: BodySignUp(),
    );
  }
}