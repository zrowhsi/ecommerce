import 'package:flutter/material.dart';

import '../../../constants/size_config.dart';
import '../../../models/homepage_model.dart';
import 'section_title.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.categoryList,
  }) : super(key: key);

  final List<CategoryList> categoryList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(5),
              vertical: getProportionateScreenHeight(5)),
          child: SectionTitle(
            press: () {
              print("click on more");
            },
            text: 'CATEGORIES',
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(5)),
        Container(
          height: getProportionateScreenHeight(150),
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) => CategoryCard(
              image: categoryList[index].docPath,
              title: categoryList[index].category,
              press: () {
                print("hello");
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key,
      required this.image,
      required this.title,
      required this.press});
  final String image;
  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(120),
        child: Column(
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                height: getProportionateScreenWidth(120),
                width: getProportionateScreenWidth(120),
                decoration: BoxDecoration(
                  // color: const Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) => const Text(
                    'Image couldn\'t load',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(5)),
            Text(
              title,
              textAlign: TextAlign.center,
              // maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
