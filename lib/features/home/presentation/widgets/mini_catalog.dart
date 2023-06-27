// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mizam_app/features/catalog/data/models/category.dart';
import 'package:mizam_app/utils/translate.dart';

import '../../../sub_category/presentation/pages/sub_categories.dart';

class MiniCatalog extends StatelessWidget {
  const MiniCatalog({super.key, required this.categoryList});
  final List<Catalog> categoryList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              category(
                'assets/icons/device.svg',
                translation(context).electronics,
                context,
                categoryList[5].name ?? '',
                categoryList[5].sub_category!,
              ),
              category(
                'assets/icons/accessories.svg',
                translation(context).accessories,
                context,
                categoryList[6].name ?? '',
                categoryList[6].sub_category!,
              ),
              category(
                'assets/icons/beauty.svg',
                translation(context).beauty,
                context,
                categoryList[4].name ?? '',
                categoryList[4].sub_category!,
              ),
              category(
                'assets/icons/house.svg',
                translation(context).for_home,
                context,
                categoryList[7].name ?? '',
                categoryList[7].sub_category!,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              category(
                'assets/icons/baby.svg',
                translation(context).children,
                context,
                categoryList[0].name ?? '',
                categoryList[0].sub_category!,
              ),
              category(
                'assets/icons/cloth.svg',
                translation(context).clothes,
                context,
                categoryList[1].name ?? '',
                categoryList[1].sub_category!,
              ),
              category(
                'assets/icons/shoes.svg',
                translation(context).footwear,
                context,
                categoryList[2].name ?? '',
                categoryList[2].sub_category!,
              ),
              category(
                'assets/icons/dot.svg',
                translation(context).other,
                context,
                categoryList[3].name ?? '',
                categoryList[3].sub_category!,
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget category(
  String url,
  String name,
  BuildContext context,
  String categoryName,
  List<String> subCategories,
) {
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
    child: SizedBox(
      height: 80,
      width: 85,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              url,
              height: 50,
              width: 50,
            ),
            const SizedBox(height: 6),
            Text(
              name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    ),
  );
}
