import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/constants/size_config.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class LoginSuccessBody extends StatelessWidget {
  const LoginSuccessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Center(
          child: Icon(
            Icons.check_circle,
            color: Colors.pink,
            size: getProportionateScreenHeight(200),
          ),
        ),
        Text(
          "Login Success",
          style: TextStyle(
              fontSize: getProportionateScreenHeight(30),
              fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        SizedBox(
            width: SizeConfig.screenHeight * 0.3,
            child: DefaultButton(
                text: "Back to Home",
                press: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                })),
        const Spacer(),
      ],
    );
  }
}
