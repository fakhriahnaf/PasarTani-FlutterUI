import 'package:flutter/material.dart';

class SizeConfig{
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultScreen;
  static double defaultSize;
  static Orientation orientation; 

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;

  }
}

//untuk hasil proporsional
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
 //812 adalah nilai pada tinggi desain 
  return (inputHeight / 1020.0) * screenHeight;
}

//untuk hasil proporsional
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
 //375 adalah nilai pada tinggi desain 
  return (inputWidth / 375.0) * screenWidth;
}

