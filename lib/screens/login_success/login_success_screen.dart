import 'package:flutter/material.dart';

import 'components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({super.key});
  static String routeName = "/login_success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Success"),
      ),
      body: const LoginSuccessBody(),
    );
  }
}
