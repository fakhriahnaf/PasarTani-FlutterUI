import 'package:flutter/material.dart';
import 'package:pasarTani/pages/login-success-screen/body-success-login.dart';

class LoginSuccess extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("LoginSuccess"),
      ),
      body: BodySuccessLogin(),
    );
  }
}