import 'dart:convert';
import 'dart:io';

import "package:async/async.dart";
import 'package:flutter/material.dart';

import 'package:path/path.dart';

import 'package:http/http.dart' as http;

import '../../constants/constants.dart';
import '../../models/product.dart';

Future<List<String>> addImageWorking(File imageFile) async {
  final token = CustomConstant().token;
  List<String> imagesResponse = [];
// ignore: deprecated_member_use
  var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  var length = await imageFile.length();
  final uri = Uri.parse(
      'http://103.104.29.53:8095/ecommerce/api/auth/vendor/product/image/save');

  Map<String, String> header = {
    'Content-Type': 'application/json',
    'UserAgent': 'mobAgent',
    'Token': token,
  };

  var request = http.MultipartRequest("POST", uri);

  var multipartFile = http.MultipartFile("file", stream, length,
      filename: basename(imageFile.path));

  request.files.add(multipartFile);
  request.headers.addAll(header);

  var response = await request.send();
  //Get the response from the server
  var responseData = await response.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);

  final jsonResponse = json.decode(responseString);
  // print(jsonResponse['docId']);
  imagesResponse.add(jsonResponse);
  return imagesResponse;
  // });
  // if (response.statusCode == 200) {
  //   print("Image Uploaded");
  // } else {
  //   print("Upload Failed");
  // }
}

Future<bool> addImage(File imageFile) async {
  final token = CustomConstant().token;

  var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  var length = await imageFile.length();
  final uri = Uri.parse(
      'http://103.104.29.53:8095/ecommerce/api/auth/vendor/product/image/save');

  Map<String, String> header = {
    'Content-Type': 'application/json',
    'UserAgent': 'mobAgent',
    'Token': token,
  };

  var request = http.MultipartRequest("POST", uri);

  var multipartFile = http.MultipartFile("file", stream, length,
      filename: basename(imageFile.path));

  request.files.add(multipartFile);
  request.headers.addAll(header);
  final response = await http.Response.fromStream(await request.send());
  // if (response.statusCode == 200) {
  //   print("Image Uploaded");
  // } else {
  //   print("Upload Failed");
  // }

  return response.statusCode == 200 ? true : false;
}
