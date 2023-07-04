// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mizam_app/l10n/language_constants.dart';
import 'package:mizam_app/main.dart';

import '../../../../common/colors/main_colors.dart';
import '../../../../common/widgets/divider.dart';
import '../../../../utils/translate.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translation(context).language,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        backgroundColor: addColor,
        elevation: 0,
      ),
      body: Column(
        children: [
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
                          translation(context).language_en,
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
            onPressed: () async {
              Locale locale = await setLocale('en');
              MyApp.setLocale(context, locale);
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
                          translation(context).language_ru,
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
            onPressed: () async {
              Locale locale = await setLocale('ru');
              MyApp.setLocale(context, locale);
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
                          translation(context).language_kz,
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
            onPressed: () async {
              Locale locale = await setLocale('kk');
              MyApp.setLocale(context, locale);
            },
          ),
        ],
      ),
    );
  }
}
