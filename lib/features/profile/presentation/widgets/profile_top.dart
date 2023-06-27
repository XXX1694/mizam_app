// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/colors/main_colors.dart';

class ProfileTop extends StatelessWidget {
  const ProfileTop({super.key, required this.full_name});
  final String full_name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Stack(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(80.0),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  child: Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/photo.svg',
                        height: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 140,
          child: Text(
            full_name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        )
      ],
    );
  }
}
