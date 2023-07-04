import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/colors/main_colors.dart';

class EditPhoto extends StatelessWidget {
  const EditPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      color: Colors.grey,
      child: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
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
      ),
    );
  }
}
