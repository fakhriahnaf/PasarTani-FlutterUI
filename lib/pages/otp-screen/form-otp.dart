import 'package:flutter/material.dart';
import 'package:pasarTani/components/default_button.dart';
import 'package:pasarTani/shared/constraint.dart';
import 'package:pasarTani/shared/size_config.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key key,
  }) : super(key: key);
  @override
  _OtpFormState createState() => _OtpFormState();
  
}

class _OtpFormState extends State<OtpForm> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField({String value,FocusNode focusNode}) {
    if(value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///FIELD OTP
              //field 1
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  style: TextStyle(fontSize:24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration, //import bulet field otp
                  onChanged: (value) {
                    nextField(value: value, focusNode:pin2FocusNode);
                  },
                ),
              ),
              //field 2
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  style: TextStyle(fontSize:24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration, //import bulet field otp
                  onChanged: (value) {
                    nextField(value: value, focusNode:pin3FocusNode);
                  },
                ),
              ),
              //field 3
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  style: TextStyle(fontSize:24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration, //import bulet field otp
                  onChanged: (value) {
                    nextField(value: value, focusNode:pin4FocusNode);
                  },
                ),
              ),
              //field 4
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  style: TextStyle(fontSize:24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration, //import bulet field otp
                  onChanged: (value) {
                    pin4FocusNode.unfocus();
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () {},
          )
        ],
      ),
    );
  }
}