import 'package:ecommerce/screens/search/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/size_config.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white.withOpacity(0.5),
        title: searchBoxForm(context),
      ),
      body: const HomeBody(),
    );
  }

  Container searchBoxForm(context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
      // height: 40,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              offset: const Offset(1.1, 1.1),
              blurRadius: 5.0),
        ],
      ),
      child: CupertinoTextField(
        readOnly: true,
        keyboardType: TextInputType.text,
        placeholder: 'Search product',
        placeholderStyle: TextStyle(
          color: const Color(0xffC4C6CC),
          fontSize: getProportionateScreenWidth(14),
          fontFamily: 'Brutal',
        ),
        onTap: () {
          Navigator.pushNamed(context, SearchScreen.routeName);
        },
        prefix: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
          child: Icon(
            Icons.search,
            size: getProportionateScreenHeight(18),
            color: Colors.black,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
      ),
    );
  }
}
