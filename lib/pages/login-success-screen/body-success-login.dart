import 'package:flutter/material.dart';
import 'package:pasarTani/components/default_button.dart';
import 'package:pasarTani/shared/size_config.dart';

class BodySuccessLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(22)),
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Image.asset(
            "assets/images/success.png",
            height: SizeConfig.screenHeight * 0.4
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Text(
            "Login Success",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )
          ),
          Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
                    child: DefaultButton(
              text:"Back to home",
              press: () {},
            ),
          ),
          Spacer(),
        ],      
      ),
    );
  }
}
