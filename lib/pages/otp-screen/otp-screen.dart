import 'package:flutter/material.dart';
import 'package:pasarTani/pages/otp-screen/body-otp.dart';
import 'package:pasarTani/shared/size_config.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Screen"),
      ),
      body: BodyOtp(),
    );
  }
}