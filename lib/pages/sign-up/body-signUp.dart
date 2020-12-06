import 'package:flutter/material.dart';
import 'package:pasarTani/components/custom_suffix_icon.dart';
import 'package:pasarTani/components/default_button.dart';
import 'package:pasarTani/components/form_error.dart';
import 'package:pasarTani/pages/sign-in/body-sign-in.dart';
import 'package:pasarTani/pages/sign-up/complete-signUp.dart';
import 'package:pasarTani/shared/constraint.dart';
import 'package:pasarTani/shared/size_config.dart';

class BodySignUp extends StatefulWidget {
  @override
  _BodySignUpState createState() => _BodySignUpState();
}

class _BodySignUpState extends State<BodySignUp> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Text(
              "Register Account", 
              style: headingStyle,
            ),
            Text(
              "Registering your account below, \n and continue",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight *0.04,),
            SignUpForm(),

          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey= GlobalKey<FormState>();
  String email;
  String password;
  String confirmPassword;
  final List<String> errors =[];

  void addError({String error}) {
    if(!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }
  void removeError({String error}) {
    if(errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFormEmailField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildFormPassField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildFormRePassField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Continue",
            press : () {
              if (_formKey.currentState.validate()) {
                //go to complete page
                Navigator.pushNamed(context, CompleteSignUpScreen.routeName);
              }
            }
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: 'assets/icons/google-icon.svg',
                    press: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/facebook-2.svg',
                    press: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/twitter.svg',
                    press: () {},
                  ),
                ],
              ),
          NoAccountText(),
        ],
      ),
    );
  }

  TextFormField buildFormRePassField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: passNullError);
        } else if (value.isNotEmpty && password == confirmPassword) {
          removeError(error: matchPassError);
        }
        confirmPassword = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: passNullError);
          return "";
        } else if ((password != value)) {
          addError(error: matchPassError);
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

  TextFormField buildFormPassField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: passNullError);
        } else if (value.length >= 8) {
          removeError(error: shortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: passNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: shortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "PASSWORD",
        hintText: "enter yOUR pAsword",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
      ));
  }

  TextFormField buildFormEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      //kalo lagi ketik lagi gak ada error messej
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: emailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: invalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: emailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: invalidEmailError);
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
}