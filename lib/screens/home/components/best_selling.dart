import 'package:flutter/material.dart';

import '../../../components/product_card.dart';
import '../../../constants/size_config.dart';
import '../../../models/homepage_model.dart';

class BestProduct extends StatelessWidget {
  const BestProduct({
    Key? key,
    required this.bestProduct,
  }) : super(key: key);

  final List<BestSellingListElement> bestProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: const Text("BEST PRODUCT")),
        SizedBox(height: getProportionateScreenWidth(10)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                  bestProduct.length,
                  (index) =>
                      ProductCard(newProductList: bestProduct, index: index)),
              // SizedBox(width: getProportionateScreenWidth(50)),
            ],
          ),
        ),
      ],
    );
  }
}
