import 'dart:io';

import 'package:flutter/material.dart';

import '../../../constants/color_theme_const.dart';

import 'components/body.dart';
import 'components/image_upload.dart';

class AddProductScreen extends StatefulWidget {
  static String routeName = "/add-product";
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: appBarGradient,
            ),
          ),
          title: const Text(
            'Add Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: const AddProductBody(),
      // body: ImageUpload(),
    );
  }
}
