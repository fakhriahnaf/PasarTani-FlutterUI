import 'package:flutter/material.dart';
import 'package:pasarTani/components/custom_suffix_icon.dart';
import 'package:pasarTani/components/default_button.dart';
import 'package:pasarTani/components/form_error.dart';
import 'package:pasarTani/pages/sign-in/body-sign-in.dart';
import 'package:pasarTani/shared/constraint.dart';
import 'package:pasarTani/shared/size_config.dart';

class BodyForgetPassword extends StatefulWidget {
  @override
  _BodyForgetPasswordState createState() => _BodyForgetPasswordState();
}

class _BodyForgetPasswordState extends State<BodyForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Forget Password",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Please enter your email \n you a link enter the account',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordForm extends StatefulWidget {
  @override
  _ForgetPasswordFormState createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
      //formEmail
      TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => email = newValue,
          //kalo lagi ketik lagi gak ada error messej
          onChanged: (value) {
            if (value.isNotEmpty && errors.contains(emailNullError)) {
              setState(() {
                errors.remove(emailNullError);
              });
            } else if (emailValidatorRegExp.hasMatch(value) &&
                errors.contains(invalidEmailError)) {
              setState(() {
                errors.remove(invalidEmailError);
              });
            }
            return null;
          },
          //add validator supaya menampilkan message harus mengisikan email
          validator: (value) {
            if (value.isEmpty && !errors.contains(emailNullError)) {
              setState(() {
                errors.add(emailNullError);
              });
            } else if (!emailValidatorRegExp.hasMatch(value) &&
                !errors.contains(invalidEmailError)) {
              setState(() {
                errors.add(invalidEmailError);
              });
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "EMAIL",
            hintText: "enter your email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(
              svgIcon: 'assets/icons/Mail.svg',
            ),
          )
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
        ]
      )
    );
  }
}
