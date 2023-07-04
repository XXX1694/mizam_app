import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mizam_app/features/my_address/presentation/pages/main_page_address.dart';
import 'package:mizam_app/utils/translate.dart';

class ChangeLocation extends StatelessWidget {
  const ChangeLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: () {
        showAddress(context);
      },
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/pointer.svg',
            // ignore: deprecated_member_use
            color: Colors.white,
            height: 24,
          ),
          const SizedBox(width: 4),
          Text(
            translation(context).location,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            translation(context).current_location,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w300,
                ),
          ),
        ],
      ),
    );
  }
}
