import 'package:flutter/material.dart';
import 'package:pasarTani/components/default_button.dart';
import 'package:pasarTani/pages/sign-in/sign-in-screen.dart';
import 'package:pasarTani/pages/spalsh-screen/splash-content.dart';
import 'package:pasarTani/shared/constraint.dart';
import 'package:pasarTani/shared/size_config.dart';



class BodySplash extends StatefulWidget {
  @override
  _BodySplashState createState() => _BodySplashState();
}

class _BodySplashState extends State<BodySplash> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text" : "Wellcome to Pasar Tani, Lets Shop!",
      "image" : "assets/images/splash_1.png"
    },
     {
      "text" : "Dapatkan segera potongan dan diskon \n untuk pembelanjaan sayur",
      "image" : "assets/images/splash_2.png"
    },
     {
      "text" : "Marilah jaga petani kita!",
      "image" : "assets/images/splash_3.dart"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: SizedBox(
       width: double.infinity,
      child: Column(
        children: <Widget>[
          Spacer(),
          Expanded(
            flex: 3,
            //usingPageview builder biar bisa ada efek geser
            child: PageView.builder( 
              onPageChanged: (value){
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
              text: splashData[index]['text'],
              image: splashData[index]['image'],
              )
            )
          ),
          //button area
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)
              ),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(splashData.length, (index) => buildDot(index: index)
                    ),
                  ),
                  Spacer(),
                  //tombol 
                  DefaultButton(
                    text: "Continue",
                    press: () {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                  ),
                  Spacer(),
                ]
              ),
            ),
          )
        ],
    ),
     )
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: animationDuration,
                margin: EdgeInsets.only(right: 5),
                height: 6,
                width: currentPage == index ? 20: 6,
                decoration: BoxDecoration(
                  color: currentPage == index ? primaryColor : Color(0xFFD8D8D8),
                  borderRadius: BorderRadius.circular(3),

                )
              );
  }
}

