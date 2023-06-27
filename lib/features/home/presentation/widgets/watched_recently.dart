import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mizam_app/common/colors/main_colors.dart';
import 'package:mizam_app/utils/translate.dart';

import '../../../../utils/divide_numbers.dart';

class WatchedRecently extends StatefulWidget {
  const WatchedRecently({super.key});

  @override
  State<WatchedRecently> createState() => _WatchedRecentlyState();
}

class _WatchedRecentlyState extends State<WatchedRecently> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            Text(
              translation(context).watched_recently,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 206,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) => Container(
              padding: index == 0
                  ? const EdgeInsets.fromLTRB(20, 0, 16, 0)
                  : const EdgeInsets.fromLTRB(0, 0, 16, 0),
              child: const MiniProduct(
                imageUrl: 'assets/images/test_img.png',
                price1: 12499,
                price2: 11499,
                productCategory: 'Headphones',
                productName: 'QCY H2 black',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MiniProduct extends StatefulWidget {
  const MiniProduct({
    super.key,
    required this.imageUrl,
    required this.price1,
    required this.price2,
    required this.productCategory,
    required this.productName,
  });
  final String imageUrl;
  final String productName;
  final String productCategory;
  final int price1;
  final int price2;
  @override
  State<MiniProduct> createState() => _MiniProductState();
}

class _MiniProductState extends State<MiniProduct> {
  late String price11;
  late String price22;
  @override
  void initState() {
    price11 = divideNumberWithSpace(widget.price1);
    price22 = divideNumberWithSpace(widget.price2);
    super.initState();
  }

  bool loved = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            width: 120,
            child: Stack(
              children: [
                Image.asset(widget.imageUrl),
                Align(
                  alignment: Alignment.topRight,
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        loved = !loved;
                      });
                    },
                    child: loved
                        ? SvgPicture.asset(
                            'assets/icons/loved.svg',
                            height: 24,
                          )
                        : SvgPicture.asset(
                            'assets/icons/love.svg',
                            height: 24,
                          ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.productName,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Colors.black),
          ),
          Text(
            widget.productCategory,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 4),
          stars(4),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$price11 KZT',
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Gilroy',
                  fontSize: 10,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                ),
              ),
              Container(
                width: 60,
                height: 18,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    '$price22 KZT',
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Gilroy',
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget stars(int num) {
  return Row(
    children: [
      num < 1
          ? SvgPicture.asset(
              'assets/icons/star_outline.svg',
              width: 8,
            )
          : SvgPicture.asset(
              'assets/icons/star_fill.svg',
              width: 8,
            ),
      const SizedBox(width: 3),
      num < 2
          ? SvgPicture.asset(
              'assets/icons/star_outline.svg',
              width: 8,
            )
          : SvgPicture.asset(
              'assets/icons/star_fill.svg',
              width: 8,
            ),
      const SizedBox(width: 3),
      num < 3
          ? SvgPicture.asset(
              'assets/icons/star_outline.svg',
              width: 8,
            )
          : SvgPicture.asset(
              'assets/icons/star_fill.svg',
              width: 8,
            ),
      const SizedBox(width: 3),
      num < 4
          ? SvgPicture.asset(
              'assets/icons/star_outline.svg',
              width: 8,
            )
          : SvgPicture.asset(
              'assets/icons/star_fill.svg',
              width: 8,
            ),
      const SizedBox(width: 3),
      num < 5
          ? SvgPicture.asset(
              'assets/icons/star_outline.svg',
              width: 8,
            )
          : SvgPicture.asset(
              'assets/icons/star_fill.svg',
              width: 8,
            ),
    ],
  );
}
