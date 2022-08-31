import 'package:ecommerce/constants/size_config.dart';
import 'package:flutter/material.dart';

import 'forgot_password_form.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Text(
              "Forgot password",
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(28),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            const Text(
              "Please enter your email address and we'll send you verification code or link to reset your password.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            const ForgotPasswordForm()
          ],
        ),
      ),
    );
  }
}
