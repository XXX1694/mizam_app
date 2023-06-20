import 'package:flutter/material.dart';
import 'package:mizam_app/common/colors/main_colors.dart';
import 'package:mizam_app/utils/translate.dart';

class CustomDevider extends StatelessWidget {
  const CustomDevider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: mainColor70,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: mainColor70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              translation(context).or_login_with,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Gilroy',
                fontSize: 14,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
