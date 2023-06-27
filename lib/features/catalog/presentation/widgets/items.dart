import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mizam_app/features/catalog/data/models/category.dart';

import '../../../../common/colors/main_colors.dart';
import '../../../sub_category/presentation/pages/sub_categories.dart';

class Items extends StatelessWidget {
  const Items(
      {super.key, required this.screenHeight, required this.categoryList});
  final double screenHeight;
  final List<Catalog> categoryList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              category(
                screenHeight,
                categoryList[5].name ?? '',
                'assets/images/electronic.png',
                context,
                categoryList[5].sub_category!,
              ),
              category(
                screenHeight,
                categoryList[6].name ?? '',
                'assets/images/accessories.png',
                context,
                categoryList[6].sub_category!,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              category(
                screenHeight,
                categoryList[4].name ?? '',
                'assets/images/beauty.png',
                context,
                categoryList[4].sub_category!,
              ),
              category(
                screenHeight,
                categoryList[7].name ?? '',
                'assets/images/for_home.png',
                context,
                categoryList[7].sub_category!,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              category(
                screenHeight,
                categoryList[0].name ?? '',
                'assets/images/children.png',
                context,
                categoryList[0].sub_category!,
              ),
              category(
                screenHeight,
                categoryList[1].name ?? '',
                'assets/images/cloth.png',
                context,
                categoryList[1].sub_category!,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              category(
                screenHeight,
                categoryList[2].name ?? '',
                'assets/images/shoes.png',
                context,
                categoryList[2].sub_category!,
              ),
              category(
                screenHeight,
                categoryList[3].name ?? '',
                'assets/images/other.png',
                context,
                categoryList[3].sub_category!,
              ),
            ],
          ),
          const SizedBox(height: 103),
        ],
      ),
    );
  }
}

Widget category(double screenHeight, String categoryName, String url,
    BuildContext context, List<String> subCategories) {
  return CupertinoButton(
    padding: const EdgeInsets.all(0),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SubCategoriesPage(
            category_name: categoryName,
            sub_category_list: subCategories,
          ),
        ),
      );
    },
    child: Container(
      height: screenHeight * 0.195,
      width: screenHeight * 0.195,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(5, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Image.asset(url),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                color: addColor70,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(10.0),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Text(
                    categoryName,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
