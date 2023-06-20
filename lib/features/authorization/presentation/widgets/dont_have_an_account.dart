import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mizam_app/common/colors/main_colors.dart';
import 'package:mizam_app/utils/translate.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 23,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            translation(context).dont_have_an_account,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.black.withOpacity(0.7),
                ),
          ),
          const Text(' '),
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Navigator.pushNamed(context, '/registration');
            },
            child: Text(
              translation(context).register,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: mainColor, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
