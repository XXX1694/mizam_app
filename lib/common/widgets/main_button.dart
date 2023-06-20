import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mizam_app/common/colors/main_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      required this.widget,
      required this.onPressed,
      required this.active});
  final Widget widget;
  final VoidCallback? onPressed;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: active ? mainColor : mainColor70,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        height: 54,
        width: double.infinity,
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}
