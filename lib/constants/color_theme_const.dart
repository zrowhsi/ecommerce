import 'package:ecommerce/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// const appPrimaryColor = Color.fromARGB(255, 74, 90, 229);
const appPrimaryColor = Colors.indigoAccent;
const appPrimaryLightColor = Color.fromARGB(255, 184, 115, 225);
const appPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromARGB(255, 185, 234, 121),
    Color.fromARGB(255, 74, 90, 229)
  ],
);
const appBarGradient = LinearGradient(
  colors: [
    Color.fromARGB(255, 69, 88, 192),
    Color.fromARGB(255, 128, 141, 211)
  ],
  stops: [0.5, 1.0],
);

const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
const backgroundColor = Colors.white;
const Color greyBackgroundCOlor = Color(0xffebecee);
var selectedNavBarColor = Colors.indigoAccent;
const unselectedNavBarColor = Colors.black87;

const appSecondaryColor = Colors.redAccent;
const appTextColor = Color(0xFF757575);

const appAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Poppins',
  primaryColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.redAccent, // Your accent color
  ),
  inputDecorationTheme: inputDecorationTheme(),
  appBarTheme: appBarTheme(),
  textTheme: textTheme(),
);

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: appTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 10),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder);
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(fontSize: 22.0, color: Colors.redAccent),
    headline2: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: Colors.redAccent,
    ),
    bodyText1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.blueAccent,
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    toolbarTextStyle: const TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ).bodyText2,
    titleTextStyle: const TextTheme(
      headline6: TextStyle(color: Colors.redAccent, fontSize: 18),
    ).headline6,
  );
}

const appDefaultDuration = Duration(milliseconds: 250);
