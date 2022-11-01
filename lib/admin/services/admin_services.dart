// import 'dart:io';

// import 'package:cloudinary_public/cloudinary_public.dart';
// import 'package:ecommerce/models/homepage_model.dart';
// import 'package:ecommerce/models/product.dart';
// import 'package:flutter/material.dart';

// class AdminService {
//   Future<void> sellProduct(
//       {required BuildContext context,
//       required int productId,
//       required String title,
//       required String description,
//       required double price,
//       required double specialPrice,
//       required double weight,
//       required int categoryId,
//       required int qty,
//       required String status,
//       required String oldCategory,
//       required File images}) async {
//     try {
//       final cloudinary = CloudinaryPublic('dtku4bfy7', 'n0cerjxb');

//       CloudinaryResponse res = await cloudinary.uploadFile(
//         CloudinaryFile.fromFile(images.path, folder: title),
//       );
//       String imagesUrls = res.secureUrl;

//       Product product = Product(
//           productId: productId,
//           title: title,
//           description: description,
//           price: price,
//           specialPrice: specialPrice,
//           weight: weight,
//           qty: qty,
//           status: status,
//           oldCategory: oldCategory,
//           categoryId: categoryId,
//           fileList: images);
//     } catch (e) {
//       e.toString();
//     }
//   }
// }
