import 'package:flutter/material.dart';

import '../constants/size_config.dart';
import '../models/homepage_model.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    required this.newProductList,
    this.aspectRatio = 1,
    this.width = 140,
    required this.index,
  }) : super(key: key);
  final double aspectRatio, width;
  int index;
  final List<BestSellingListElement> newProductList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: aspectRatio,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  // padding: EdgeInsets.all(getProportionateScreenHeight(10)),
                  decoration: BoxDecoration(
                    // color: appSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.network(newProductList[index].docPath),
                ),
              ),
              const SizedBox(height: 5),

              Container(
                height: getProportionateScreenWidth(60),
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newProductList[index].title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(12)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Text(
                      'रु ' + newProductList[index].price.toStringAsFixed(1),
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          fontWeight: FontWeight.w500,
                          color: Colors.red),
                    ),
                  ],
                ),
              ),
              // Row(
              //   children: [
              //     Text(
              //       newProductList[index].price.toString(),
              //       style: TextStyle(
              //           fontSize: getProportionateScreenWidth(18),
              //           fontWeight: FontWeight.w600,
              //           color: Colors.red),
              //     ),
              //     InkWell(
              //       borderRadius: BorderRadius.circular(30),
              //       onTap: () {
              //         print("favourite");
              //       },
              //       child: Container(
              //         width: getProportionateScreenWidth(28),
              //         height: getProportionateScreenWidth(28),
              //         decoration: BoxDecoration(
              //             color: appSecondaryColor.withOpacity(0.1),
              //             shape: BoxShape.circle),
              //         child: const Icon(Icons.favorite),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
