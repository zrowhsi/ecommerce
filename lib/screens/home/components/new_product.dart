import 'package:flutter/material.dart';

import '../../../components/product_card.dart';
import '../../../constants/size_config.dart';
import '../../../models/homepage_model.dart';

class NewProduct extends StatelessWidget {
  const NewProduct({
    Key? key,
    required this.newProductList,
  }) : super(key: key);

  final List<BestSellingListElement> newProductList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: const Text("NEW PRODUCT")),
        SizedBox(height: getProportionateScreenWidth(10)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                  newProductList.length,
                  (index) => ProductCard(
                      newProductList: newProductList, index: index)),
              // SizedBox(width: getProportionateScreenWidth(50)),
            ],
          ),
        ),
      ],
    );
  }
}
