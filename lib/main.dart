import 'package:ecommerce/constants/color_theme_const.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: SplashScreen.routeName,
      routes: routes,
      // home: const SplashScreen(),
    );
  }
}
