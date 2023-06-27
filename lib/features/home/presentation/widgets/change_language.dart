import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      padding: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0), color: Colors.white),
        height: 28,
        width: 72,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/earth.svg',
                height: 18,
                // ignore: deprecated_member_use
                color: const Color(0XFF333333),
              ),
              const SizedBox(width: 5),
              const Text(
                'Eng',
                style: TextStyle(
                  color: Color(0XFF333333),
                  fontFamily: 'Gilroy',
                  fontSize: 12,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
