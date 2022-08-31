// To parse this JSON data, do
//
//     final homePageModel = homePageModelFromJson(jsonString);

import 'dart:convert';

HomePageModel homePageModelFromJson(String str) =>
    HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  HomePageModel({
    required this.recommendationList,
    required this.bestSellingList,
    required this.newProductList,
    required this.bannerList,
    required this.categoryList,
  });

  List<BestSellingListElement> recommendationList;
  List<BestSellingListElement> bestSellingList;
  List<BestSellingListElement> newProductList;
  List<BannerList> bannerList;
  List<CategoryList> categoryList;

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
        recommendationList: List<BestSellingListElement>.from(
            json["recommendationList"]
                .map((x) => BestSellingListElement.fromJson(x))),
        bestSellingList: List<BestSellingListElement>.from(
            json["bestSellingList"]
                .map((x) => BestSellingListElement.fromJson(x))),
        newProductList: List<BestSellingListElement>.from(json["newProductList"]
            .map((x) => BestSellingListElement.fromJson(x))),
        bannerList: List<BannerList>.from(
            json["bannerList"].map((x) => BannerList.fromJson(x))),
        categoryList: List<CategoryList>.from(
            json["categoryList"].map((x) => CategoryList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recommendationList":
            List<dynamic>.from(recommendationList.map((x) => x.toJson())),
        "bestSellingList":
            List<dynamic>.from(bestSellingList.map((x) => x.toJson())),
        "newProductList":
            List<dynamic>.from(newProductList.map((x) => x.toJson())),
        "bannerList": List<dynamic>.from(bannerList.map((x) => x.toJson())),
        "categoryList": List<dynamic>.from(categoryList.map((x) => x.toJson())),
      };
}

class BannerList {
  BannerList({
    required this.bannerId,
    required this.docPath,
  });

  int bannerId;
  String docPath;

  factory BannerList.fromJson(Map<String, dynamic> json) => BannerList(
        bannerId: json["bannerId"],
        docPath: json["docPath"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "bannerId": bannerId,
        "docPath": docPath,
      };
}

class BestSellingListElement {
  BestSellingListElement({
    required this.productId,
    required this.title,
    required this.price,
    required this.categoryId,
    required this.docPath,
  });

  int productId;
  String title;
  double price;
  int categoryId;
  String docPath;

  factory BestSellingListElement.fromJson(Map<String, dynamic> json) =>
      BestSellingListElement(
        productId: json["productId"],
        title: json["title"],
        price: json["price"],
        categoryId: json["categoryId"],
        docPath: json["docPath"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "title": title,
        "price": price,
        "categoryId": categoryId,
        "docPath": docPath,
      };
}

class CategoryList {
  CategoryList({
    required this.categoryId,
    required this.category,
    required this.level,
    required this.parentId,
    required this.docPath,
  });

  int categoryId;
  String category;
  String level;
  int parentId;
  String docPath;

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        categoryId: json["categoryId"],
        category: json["category"],
        level: json["level"],
        parentId: json["parentId"],
        docPath: json["docPath"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "category": category,
        "level": level,
        "parentId": parentId,
        "docPath": docPath,
      };
}
