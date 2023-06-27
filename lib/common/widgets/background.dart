import 'package:flutter/material.dart';
import 'package:mizam_app/common/colors/main_colors.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height * 0.34,
          color: addColor,
        ),
        Container(
          height: height * 0.66,
          color: Colors.white,
        ),
      ],
    );
  }
}
