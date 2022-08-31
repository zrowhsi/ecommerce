import 'package:flutter/material.dart';

import '../../../constants/color_theme_const.dart';
import '../../../constants/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          "Ecommerce",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: appPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: getProportionateScreenHeight(270),
          width: getProportionateScreenWidth(235),
        )
      ],
    );
  }
}
