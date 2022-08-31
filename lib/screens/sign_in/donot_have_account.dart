import 'package:ecommerce/screens/sing_up/sign_up_screeen.dart';
import 'package:flutter/material.dart';

import '../../constants/size_config.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(18)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: Theme.of(context).colorScheme.secondary),
          ),
        )
      ],
    );
  }
}
