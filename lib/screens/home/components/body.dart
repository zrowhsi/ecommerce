import 'dart:async';

import 'package:ecommerce/constants/color_theme_const.dart';
import 'package:ecommerce/constants/size_config.dart';
import 'package:ecommerce/screens/home/components/best_selling.dart';
import 'package:ecommerce/screens/home/components/recommendation.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../models/homepage_model.dart';
import 'package:http/http.dart' as http;

import 'categories.dart';
import 'home_carousel.dart';
import 'itemwidget.dart';
import 'new_product.dart';
import 'section_title.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<BestSellingListElement> recommendationList = [];
  List<BestSellingListElement> bestSellingList = [];
  List<BestSellingListElement> newProductList = [];
  List<BannerList> bannerList = [];
  List<CategoryList> categoryList = [];

  Future<bool> getHomePage() async {
    final token = CustomConstant().token;

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'UserAgent': 'mobAgent',
      'Token': token,
    };
    final uri =
        Uri.parse('http://103.104.29.53:8095/ecommerce/api/auth/home/product');
    var response = await http.get(uri, headers: header);

    if (response.statusCode == 200) {
      final result = homePageModelFromJson(response.body);
      bannerList = result.bannerList;
      recommendationList = result.recommendationList;
      newProductList = result.newProductList;
      bestSellingList = result.bestSellingList;
      categoryList = result.categoryList;

      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  late final timer;
  @override
  void initState() {
    super.initState();
    if (mounted) {
      getHomePage();
      timer = Timer.periodic(
          const Duration(milliseconds: 1000), (Timer t) => setState(() {}));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // SizedBox(height: getProportionateScreenHeight(10)),
          HomeCarousel(bannerList: bannerList),
          SizedBox(height: getProportionateScreenWidth(5)),
          Categories(categoryList: categoryList),
          SizedBox(height: getProportionateScreenWidth(5)),
          NewProduct(newProductList: newProductList),
          SizedBox(height: getProportionateScreenWidth(10)),
          BestProduct(bestProduct: bestSellingList),
          SizedBox(height: getProportionateScreenWidth(10)),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: const Text(
              "RECOMMENDATION",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ItemWidget(recommendationList: recommendationList),
          // RecommendationProduct(recommendationList: recommendationList),
        ],
      ),
    );
  }
}
