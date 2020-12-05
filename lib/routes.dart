//import 'package:js/js.dart';
import 'package:pasarTani/pages/forgot-password/forgot-password-screen.dart';
import 'package:pasarTani/pages/login-success-screen/login-success.dart';
import 'package:pasarTani/pages/spalsh-screen/splash-screen.dart';
import 'package:flutter/widgets.dart';
import 'package:pasarTani/pages/sign-in/sign-in-screen.dart';
//import 'package:pasarTani/pages/forgot-password/forgot-password-screen.dart';
//import 'package:pasarTani/pages/spalsh-screen/splash-screen.dart';



final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName : (context) => ForgotPasswordScreen(),
  LoginSuccess.routeName : (context) => LoginSuccess(),
  
};