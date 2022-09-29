import 'package:ecommerce/constants/size_config.dart';
import 'package:ecommerce/models/homepage_model.dart';
import 'package:flutter/material.dart';

import '../../details/details_screen.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({super.key, required this.recommendationList});
  List<BestSellingListElement> recommendationList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.count(
        padding: EdgeInsets.all(0),
        childAspectRatio: 0.8,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          for (int i = 1; i < recommendationList.length; i++)
            Card(
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Container(
                    //       padding: EdgeInsets.all(5),
                    //       decoration: BoxDecoration(
                    //         color: Colors.blueGrey,
                    //         borderRadius: BorderRadius.circular(20),
                    //       ),
                    //       child: Text(
                    //         "-50% only",
                    //         style: TextStyle(
                    //           fontSize: 14,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ),
                    //     Icon(
                    //       Icons.favorite_border,
                    //       color: Colors.red,
                    //     ),
                    //   ],
                    // ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, DetailsScreen.routeName,
                            arguments: ProductDetailsArguments(
                                product: recommendationList[i]));
                      },
                      child: Container(
                        // margin: EdgeInsets.all(10),
                        child: Image.network(
                          recommendationList[i].docPath,
                          // height: SizeConfig.screenWidth,
                          // width: SizeConfig.screenWidth,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            recommendationList[i].title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: getProportionateScreenWidth(12)),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'रु ' +
                                    recommendationList[i]
                                        .price
                                        .toStringAsFixed(1),
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(10),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                              ),
                              Icon(Icons.shopping_cart_checkout)
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
