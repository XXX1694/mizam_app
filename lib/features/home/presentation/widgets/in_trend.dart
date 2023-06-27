import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mizam_app/common/colors/main_colors.dart';
import 'package:mizam_app/utils/divide_numbers.dart';
import 'package:mizam_app/utils/translate.dart';

class InTrend extends StatefulWidget {
  const InTrend({super.key});

  @override
  State<InTrend> createState() => _InTrendState();
}

class _InTrendState extends State<InTrend> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            translation(context).in_trend,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MiniProduct(
                imageUrl: 'assets/images/test_img.png',
                price1: 12499,
                price2: 11499,
                productCategory: 'Headphones',
                productName: 'QCY H2 black',
              ),
              MiniProduct(
                imageUrl: 'assets/images/test_img.png',
                price1: 12499,
                price2: 11499,
                productCategory: 'Headphones',
                productName: 'QCY H2 black',
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MiniProduct(
                imageUrl: 'assets/images/test_img.png',
                price1: 12499,
                price2: 11499,
                productCategory: 'Headphones',
                productName: 'QCY H2 black',
              ),
              MiniProduct(
                imageUrl: 'assets/images/test_img.png',
                price1: 12499,
                price2: 11499,
                productCategory: 'Headphones',
                productName: 'QCY H2 black',
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MiniProduct(
                imageUrl: 'assets/images/test_img.png',
                price1: 12499,
                price2: 11499,
                productCategory: 'Headphones',
                productName: 'QCY H2 black',
              ),
              MiniProduct(
                imageUrl: 'assets/images/test_img.png',
                price1: 12499,
                price2: 11499,
                productCategory: 'Headphones',
                productName: 'QCY H2 black',
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MiniProduct(
                imageUrl: 'assets/images/test_img.png',
                price1: 12499,
                price2: 11499,
                productCategory: 'Headphones',
                productName: 'QCY H2 black',
              ),
              MiniProduct(
                imageUrl: 'assets/images/test_img.png',
                price1: 12499,
                price2: 11499,
                productCategory: 'Headphones',
                productName: 'QCY H2 black',
              ),
            ],
          ),
        ],
      ),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 170,
            width: 170,
            child: Stack(
              children: [
                Image.asset(widget.imageUrl),
                Align(
                  alignment: Alignment.topRight,
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(4),
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
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                ),
          ),
          const SizedBox(height: 2),
          Text(
            widget.productCategory,
            style:
                Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 4),
          stars(4),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$price11 KZT',
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Gilroy',
                  fontSize: 16,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                ),
              ),
              Container(
                width: 83,
                height: 28,
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
                      fontSize: 14,
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
              width: 12,
            )
          : SvgPicture.asset(
              'assets/icons/star_fill.svg',
              width: 12,
            ),
      const SizedBox(width: 4),
      num < 2
          ? SvgPicture.asset(
              'assets/icons/star_outline.svg',
              width: 12,
            )
          : SvgPicture.asset(
              'assets/icons/star_fill.svg',
              width: 12,
            ),
      const SizedBox(width: 4),
      num < 3
          ? SvgPicture.asset(
              'assets/icons/star_outline.svg',
              width: 12,
            )
          : SvgPicture.asset(
              'assets/icons/star_fill.svg',
              width: 12,
            ),
      const SizedBox(width: 4),
      num < 4
          ? SvgPicture.asset(
              'assets/icons/star_outline.svg',
              width: 12,
            )
          : SvgPicture.asset(
              'assets/icons/star_fill.svg',
              width: 12,
            ),
      const SizedBox(width: 4),
      num < 5
          ? SvgPicture.asset(
              'assets/icons/star_outline.svg',
              width: 12,
            )
          : SvgPicture.asset(
              'assets/icons/star_fill.svg',
              width: 12,
            ),
    ],
  );
}
