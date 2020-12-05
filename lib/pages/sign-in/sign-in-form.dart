import 'package:flutter/material.dart';
import 'package:pasarTani/components/custom_suffix_icon.dart';
import 'package:pasarTani/components/default_button.dart';
import 'package:pasarTani/components/form_error.dart';
import 'package:pasarTani/pages/forgot-password/forgot-password-screen.dart';
import 'package:pasarTani/pages/login-success-screen/login-success.dart';
import 'package:pasarTani/shared/constraint.dart';
import 'package:pasarTani/shared/size_config.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailForm(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordForm(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            children: [
              Checkbox(
                  value: remember,
                  activeColor: primaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  }),
              Text("Remember Me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "ForgotPassword",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                Navigator.pushNamed(context, LoginSuccess.routeName);
              }
            },
          )
        ],
      ),
    );
  }
//BUILD CHECK BOX DAN FORGOT PASSWORD BUTTON

  //formEmail
  TextFormField buildEmailForm() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue,
        //kalo lagi ketik lagi gak ada error messej
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(emailNullError)) {
            setState(() {
              errors.remove(emailNullError);
            });
            return "";
          } else if (emailValidatorRegExp.hasMatch(value) &&
              errors.contains(invalidEmailError)) {
            setState(() {
              errors.remove(invalidEmailError);
            });
            return "";
          }
          return null;
        },
        //add validator supaya menampilkan message harus mengisikan email
        validator: (value) {
          if (value.isEmpty && !errors.contains(emailNullError)) {
            setState(() {
              errors.add(emailNullError);
            });
            return "";
          } else if (!emailValidatorRegExp.hasMatch(value) &&
              !errors.contains(invalidEmailError)) {
            setState(() {
              errors.add(invalidEmailError);
            });
            return "";
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
        ));
  }

  //form pasword
  TextFormField buildPasswordForm() {
    return TextFormField(
        obscureText: true,
        onSaved: (newValue) => password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(passNullError)) {
            setState(() {
              errors.remove(passNullError);
            });
            return "";
          } else if (value.length >= 8 && errors.contains(shortPassError)) {
            setState(() {
              errors.remove(shortPassError);
            });
            return "";
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty && !errors.contains(passNullError)) {
            setState(() {
              errors.add(passNullError);
            });
            return "";
          } else if (value.length < 8 && !errors.contains(shortPassError)) {
            setState(() {
              errors.add(shortPassError);
            });
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "PASSWORD",
          hintText: "enter yOUR pAsword",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/Mail.svg',
          ),
        ));
  }
}
