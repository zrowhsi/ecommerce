import 'package:ecommerce/constants/size_config.dart';
import 'package:flutter/material.dart';

import '../donot_have_account.dart';
import 'sign_in_form.dart';
import 'social_network_card.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenHeight(28),
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Sign in with you email and password!",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignInForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                const Text(
                  "or  continue with ",
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
                SizedBox(height: getProportionateScreenHeight(20)),
                const DoNotHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
