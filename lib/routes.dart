import 'package:ecommerce/admin/screens/add_product/add_product_screen.dart';
import 'package:ecommerce/admin/screens/admin_screen.dart';
import 'package:ecommerce/admin/screens/post_screen.dart';
import 'package:ecommerce/screens/complete_profile/complete_profile_screen.dart';
import 'package:ecommerce/screens/details/details_screen.dart';
import 'package:ecommerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/login_success/login_success_screen.dart';
import 'package:ecommerce/screens/otp/otp_screen.dart';
import 'package:ecommerce/screens/search/search_screen.dart';
import 'package:ecommerce/screens/sign_in/signin_screen.dart';
import 'package:ecommerce/screens/sing_up/sign_up_screeen.dart';
import 'package:ecommerce/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

//all named routes here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  SearchScreen.routeName: (context) => const SearchScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  AdminScreen.routeName: (context) => const AdminScreen(),
  PostScreen.routeName: (context) => const PostScreen(),
  AddProductScreen.routeName: (context) => const AddProductScreen(),
};
