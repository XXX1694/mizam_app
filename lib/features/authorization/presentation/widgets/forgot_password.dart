import 'package:flutter/cupertino.dart';
import 'package:mizam_app/common/colors/main_colors.dart';
import 'package:mizam_app/utils/translate.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: CupertinoButton(
        padding: const EdgeInsets.all(0),
        onPressed: () {
          Navigator.pushNamed(context, '/forgot_password');
        },
        child: Text(
          translation(context).forgot_password,
          style: TextStyle(
            color: mainColor,
            fontFamily: 'Gilroy',
            fontSize: 14,
            letterSpacing: 0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
