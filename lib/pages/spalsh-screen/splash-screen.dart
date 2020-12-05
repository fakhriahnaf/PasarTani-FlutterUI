import 'package:flutter/material.dart';
import 'package:pasarTani/pages/spalsh-screen/body.dart';
import 'package:pasarTani/shared/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BodySplash(),
    );
  }
}