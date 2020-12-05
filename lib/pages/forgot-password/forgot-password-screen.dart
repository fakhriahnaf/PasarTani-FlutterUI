import 'package:flutter/material.dart';
import 'package:pasarTani/pages/forgot-password/body-forgetPasword.dart';


class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("FORGOT PASSWORD")
      ),
      body: BodyForgetPassword(),
      
    );
  }
}