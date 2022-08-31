import 'package:flutter/material.dart';

import '../../../constants/size_config.dart';

class SocialNetwork extends StatelessWidget {
  const SocialNetwork({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);
  final Icon icon;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenWidth(40),
        decoration: const BoxDecoration(
          // color: Colors.black12,
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
