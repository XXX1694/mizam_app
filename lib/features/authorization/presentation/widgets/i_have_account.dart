import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/colors/main_colors.dart';
import '../../../../utils/translate.dart';

class IHaveAccount extends StatelessWidget {
  const IHaveAccount({super.key});

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
            translation(context).i_have_account,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.black.withOpacity(0.7),
                ),
          ),
          const Text(' '),
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              translation(context).log_in,
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
