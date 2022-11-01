// To parse this JSON data, do
//
//     final productFileSave = productFileSaveFromJson(jsonString);

import 'dart:convert';

ProductFileSave productFileSaveFromJson(String str) =>
    ProductFileSave.fromJson(json.decode(str));

String productFileSaveToJson(ProductFileSave data) =>
    json.encode(data.toJson());

class ProductFileSave {
  ProductFileSave({
    required this.docId,
    required this.docPath,
  });

  int docId;
  String docPath;

  factory ProductFileSave.fromJson(Map<String, dynamic> json) =>
      ProductFileSave(
        docId: json["docId"],
        docPath: json["docPath"],
      );

  Map<String, dynamic> toJson() => {
        "docId": docId,
        "docPath": docPath,
      };
}
