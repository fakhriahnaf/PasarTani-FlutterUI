//key Image, and Text
import 'package:flutter/material.dart';
import 'package:pasarTani/shared/constraint.dart';
import 'package:pasarTani/shared/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Pasar Tani",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: primaryColor,
            fontWeight: FontWeight.bold,
        ),  
      ),
      Text(
        text,
        textAlign: TextAlign.center
      ),
      Spacer(flex: 1),
      Image.asset(
        image,
        width: getProportionateScreenWidth(155),
        height: getProportionateScreenHeight(165),
      )
    ],
    );
  }
}