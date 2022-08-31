import 'package:ecommerce/constants/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants/color_theme_const.dart';
import 'complete_profile_form.dart';

class CompleteProfileBody extends StatelessWidget {
  const CompleteProfileBody({super.key});

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
                "Complete Profile",
                style: headingStyle,
              ),
              const Text(
                "Complete your profile details ",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              CompleteProfileForm(),
            ],
          ),
        ),
      ),
    );
  }
}
