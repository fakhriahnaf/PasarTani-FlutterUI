import 'package:flutter/material.dart';
import 'package:pasarTani/components/custom_suffix_icon.dart';
import 'package:pasarTani/components/default_button.dart';
import 'package:pasarTani/components/form_error.dart';
import 'package:pasarTani/pages/otp-screen/otp-screen.dart';
import 'package:pasarTani/shared/constraint.dart';
import 'package:pasarTani/shared/size_config.dart';

class BodyCompleteSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView( //supaya bisa di scroll
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Complete your Account",
                style: headingStyle,
              ),
              Text(
                "complete the detail of your personality",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              CompleteRegisterForm(),
              SizedBox(height: getProportionateScreenHeight(30)),
              Text("by Continuing your confirm that you agree \nwith our term and condition")
            ],
          ),
        ),
      ),
    );
  }
}

class CompleteRegisterForm extends StatefulWidget {
  @override
  _CompleteRegisterFormState createState() => _CompleteRegisterFormState();
}

class _CompleteRegisterFormState extends State<CompleteRegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
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
          buildFirstNameField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                //otp screen
                Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildAddressField() {
    return TextFormField(
        onSaved: (newValue) => address = newValue,
        //kalo lagi ketik lagi gak ada error messej
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: addressNullError);
          }
          return null;
        },
        //add validator supaya menampilkan message harus mengisikan email
        validator: (value) {
          if (value.isEmpty) {
            addError(error: addressNullError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Address",
          hintText: "enter your address",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/Location_point.svg',
          ),
        ));
  }

  TextFormField buildPhoneNumberField() {
    return TextFormField(
        keyboardType: TextInputType.number,
        onSaved: (newValue) => phoneNumber = newValue,
        //kalo lagi ketik lagi gak ada error messej
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: phoneNumberNullError);
          }
          return null;
        },
        //add validator supaya menampilkan message harus mengisikan field
        validator: (value) {
          if (value.isEmpty) {
            addError(error: phoneNumberNullError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Phone Number",
          hintText: "enter your phone Number",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/Phone.svg',
          ),
        ));
  }

  TextFormField buildLastNameField() {
    return TextFormField(
        onSaved: (newValue) => lastName = newValue,
        //kalo lagi ketik lagi gak ada error messej
        decoration: InputDecoration(
          labelText: "Last Name",
          hintText: "enter your first name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/User.svg',
          ),
        ));
  }

  TextFormField buildFirstNameField() {
    return TextFormField(
        onSaved: (newValue) => firstName = newValue,
        //kalo lagi ketik lagi gak ada error messej
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: namelNullError);
          }
          return null;
        },
        //add validator supaya menampilkan message harus mengisikan email
        validator: (value) {
          if (value.isEmpty) {
            addError(error: namelNullError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "First Name",
          hintText: "enter your first name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(
            svgIcon: 'assets/icons/User.svg',
          ),
        ));
  }
}
