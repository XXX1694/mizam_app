// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mizam_app/common/colors/main_colors.dart';
import 'package:mizam_app/features/cart/presentation/pages/cart_page.dart';
import 'package:mizam_app/features/catalog/presentation/pages/catalog_page.dart';
import 'package:mizam_app/features/featured/presentation/pages/featured_page.dart';
import 'package:mizam_app/features/home/presentation/pages/home_page.dart';
import 'package:mizam_app/features/profile/presentation/pages/profile_page.dart';
import 'package:mizam_app/utils/translate.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

int currentPage = 0;

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: Colors.white,
      tabBar: CupertinoTabBar(
        activeColor: addColor,
        inactiveColor: const Color(0XFF8AA6A3),
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: translation(context).home,
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: currentPage == 0 ? addColor : const Color(0XFF8AA6A3),
              height: 26,
            ),
          ),
          BottomNavigationBarItem(
            label: translation(context).catalog,
            icon: SvgPicture.asset(
              'assets/icons/catalog.svg',
              color: currentPage == 1 ? addColor : const Color(0XFF8AA6A3),
              height: 26,
            ),
          ),
          BottomNavigationBarItem(
            label: translation(context).featured,
            icon: SvgPicture.asset(
              'assets/icons/featured.svg',
              color: currentPage == 2 ? addColor : const Color(0XFF8AA6A3),
              height: 26,
            ),
          ),
          BottomNavigationBarItem(
            label: translation(context).cart,
            icon: SvgPicture.asset(
              'assets/icons/cart.svg',
              color: currentPage == 3 ? addColor : const Color(0XFF8AA6A3),
              height: 26,
            ),
          ),
          BottomNavigationBarItem(
            label: translation(context).profile,
            icon: SvgPicture.asset(
              'assets/icons/profile.svg',
              color: currentPage == 4 ? addColor : const Color(0XFF8AA6A3),
              height: 26,
            ),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const HomePage();
          case 1:
            return const CatalogPage();
          case 2:
            return const FeaturedPage();
          case 3:
            return const CartPage();
          case 4:
            return const ProfilePage();
          default:
            return const HomePage();
        }
      },
    );
  }
}
