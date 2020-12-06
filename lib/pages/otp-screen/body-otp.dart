import 'package:flutter/material.dart';
//import 'package:pasarTani/components/default_button.dart';
import 'package:pasarTani/pages/otp-screen/form-otp.dart';
import 'package:pasarTani/shared/constraint.dart';
import 'package:pasarTani/shared/size_config.dart';

class BodyOtp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
                  child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text("Otp Vertification", style: headingStyle),
              Text("We Sent your code to, 0819-3111-****"), //masukin nomer
              buildTimerAttack(),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Resend OTP code?",
                  style: TextStyle(decoration: TextDecoration.underline),
                  
                  
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimerAttack() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, //supaya mulai ditengah
      children: [
        Text("This code will be expired in  "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0), //buat waktu nya
          duration: Duration(seconds: 30),
          builder: (_, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: primaryColor),
          ),
          onEnd: () {},
        )
      ],
    );
  }
}
