import 'package:flutter/material.dart';
import 'package:mizam_app/common/colors/main_colors.dart';

class BackgroundShort extends StatelessWidget {
  const BackgroundShort({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height * 0.22,
          color: addColor,
        ),
        Container(
          height: height * 0.78,
          color: Colors.white,
        ),
      ],
    );
  }
}
