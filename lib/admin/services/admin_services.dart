import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:ecommerce/models/homepage_model.dart';
import 'package:flutter/material.dart';

class AdminService {
  Future<void> sellProduct(
      {required BuildContext context,
      required int productId,
      required String title,
      required String description,
      required double price,
      required int categoryId,
      required File images}) async {
    try {
      final cloudinary = CloudinaryPublic('dtku4bfy7', 'n0cerjxb');

      CloudinaryResponse res = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(images.path, folder: title),
      );
      String imagesUrls = res.secureUrl;

      BestSellingListElement product = BestSellingListElement(
          productId: productId,
          title: title,
          price: price,
          categoryId: categoryId,
          docPath: imagesUrls);
    } catch (e) {
      e.toString();
    }
  }
}
