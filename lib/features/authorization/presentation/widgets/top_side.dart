import 'package:flutter/material.dart';

class TopSide extends StatelessWidget {
  const TopSide({
    super.key,
    required this.mainText,
    required this.secondText,
    required this.deviceHeight,
  });
  final String mainText;
  final String secondText;
  final double deviceHeight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight * 0.27,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Text(
            mainText,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Text(
            secondText,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 57),
        ],
      ),
    );
  }
}
