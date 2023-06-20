import 'package:flutter/material.dart';
import 'package:mizam_app/common/colors/main_colors.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 34,
          child: Container(
            color: addColor,
          ),
        ),
        Expanded(
          flex: 66,
          child: Container(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
