import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/colors/main_colors.dart';
import '../../../../common/widgets/divider.dart';
import '../../../../utils/translate.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text(
            translation(context).settings,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: addColor,
          elevation: 0,
        ),
        const SizedBox(height: 8),
        CupertinoButton(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        translation(context).theme,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Gilroy',
                          fontSize: 22,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const CustomDivider(),
            ],
          ),
          onPressed: () {},
        ),
        CupertinoButton(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        translation(context).languagee,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Gilroy',
                          fontSize: 22,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const CustomDivider(),
            ],
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/language');
          },
        ),
        CupertinoButton(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        translation(context).faq,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Gilroy',
                          fontSize: 22,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const CustomDivider(),
            ],
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
