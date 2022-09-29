import 'package:ecommerce/admin/screens/admin_screen.dart';
import 'package:ecommerce/constants/color_theme_const.dart';
import 'package:ecommerce/constants/size_config.dart';
import 'package:ecommerce/screens/sign_in/signin_screen.dart';
import 'package:ecommerce/screens/splash/components/splash_content.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Hamro Ecommerce, Let’s shop!",
      "image": "assets/images/welcome_image.png"
    },
    {
      "text": "We help people conect with store \naround Damak and East Nepal",
      "image": "assets/images/welcome_image2.png"
    },
    {
      "text":
          "We show the easy way to shop. \nConnect directly with vendor  through us",
      "image": "assets/images/welcome_image3.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, i) => SplashContent(
                text: splashData[i]["text"].toString(),
                image: splashData[i]["image"].toString(),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  const Spacer(flex: 3),
                  DefaultButton(
                    text: 'Continue',
                    press: () {
                      // print("pushed route name");
                      Navigator.pushNamed(context, AdminScreen.routeName);
                    },
                    // press: () {
                    //   // print("pushed route name");
                    //   Navigator.pushNamed(context, SignInScreen.routeName);
                    // },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  AnimatedContainer buildDot({
    int? index,
  }) {
    return AnimatedContainer(
      duration: appAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? appPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
