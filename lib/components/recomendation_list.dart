import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../constants/size_config.dart';
import '../../../models/homepage_model.dart';

class RecommendationProduct extends StatelessWidget {
  const RecommendationProduct({
    Key? key,
    required this.recommendationList,
  }) : super(key: key);

  final List<BestSellingListElement> recommendationList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenWidth(10)),
          child: const Text("RECOMMENDATION"),
        ),
        // SizedBox(height: getProportionateScreenWidth(10)),
        Container(
            padding: EdgeInsets.all(10),
            child: GridView.builder(
                // scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recommendationList.length,
                primary: true,
                shrinkWrap: true,
                // addAutomaticKeepAlives: true,
                padding: const EdgeInsets.all(0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 3,
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: getProportionateScreenHeight(110),
                          width: SizeConfig.screenWidth,
                          decoration: BoxDecoration(
                            // color: appSecondaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Image.network(
                            recommendationList[index].docPath,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          // height: getProportionateScreenHeight(50),
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recommendationList[index].title,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getProportionateScreenWidth(12)),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'रु ' +
                                    recommendationList[index]
                                        .price
                                        .toStringAsFixed(1),
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(14),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })),
      ],
    );
  }
}

class RecommendationCard extends StatelessWidget {
  RecommendationCard({
    Key? key,
    required this.recommendationList,
    this.aspectRatio = 1,
    this.width = 140,
    required this.index,
  }) : super(key: key);
  final double aspectRatio, width;
  int index;
  final List<BestSellingListElement> recommendationList;

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
              Container(
                height: 90,
                clipBehavior: Clip.antiAlias,
                // padding: EdgeInsets.all(getProportionateScreenHeight(10)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.network(recommendationList[index].docPath),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recommendationList[index].title,
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
                      'रु ' +
                          recommendationList[index].price.toStringAsFixed(1),
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          fontWeight: FontWeight.w500,
                          color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
