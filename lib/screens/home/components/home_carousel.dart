import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../constants/size_config.dart';
import '../../../models/homepage_model.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({
    Key? key,
    required this.bannerList,
  }) : super(key: key);

  final List<BannerList> bannerList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenHeight(20)),
      child: CarouselSlider(
        items: [
          for (var i = 0; i < bannerList.length; i++)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                    bannerList[i].docPath,
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
        ],
        options: CarouselOptions(
          height: getProportionateScreenHeight(180),
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 4 / 3,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}
