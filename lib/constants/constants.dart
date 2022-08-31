import 'package:flutter/material.dart';

class CustomConstant {
  final String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJUZXN0ZXIiLCJ1c2VySWQiOjEsInJvbGUiOiJVU0VSIiwiaWF0IjoxNjYwMjQ4Nzc0fQ.0jkthCgugwoloAz4jMXf14iMaWD0DI9G10UDVlFS8SBVpMoEGN0l9cXsXotho7zYWtBCm-S9Ho0h_yqGf33yHQ";
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}
