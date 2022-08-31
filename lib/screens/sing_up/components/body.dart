import 'package:ecommerce/constants/color_theme_const.dart';
import 'package:ecommerce/constants/size_config.dart';
import 'package:flutter/material.dart';

import '../../sign_in/components/social_network_card.dart';
import 'sign_up_form.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Register Account",
                style: headingStyle,
              ),
              const Text(
                "Compelete details",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              const SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              const Text(
                "or  connect with ",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialNetwork(
                    icon: const Icon(Icons.facebook, color: Colors.blue),
                    press: () {},
                  ),
                  SocialNetwork(
                    icon: const Icon(Icons.g_mobiledata, color: Colors.red),
                    press: () {},
                  ),
                  SocialNetwork(
                    icon: const Icon(Icons.apple, color: Colors.black),
                    press: () {},
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(40)),
              const Text(
                "By continuing, you confirm that you agree \nwith our Term and Condition",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
