import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SvgPicture.asset(
        'assets/icons/ring.svg',
        height: 22,
      ),
      onTap: () {
        Navigator.pushNamed(context, '/notification');
      },
    );
  }
}
