import 'package:flutter/material.dart';
import 'package:mizam_app/common/colors/main_colors.dart';

import '../../../../utils/translate.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: addColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SizedBox(
            height: 48,
            width: double.infinity,
            child: Center(
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.black.withOpacity(0.7),
                    ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 16),
                  fillColor: Colors.white,
                  hintText: translation(context).search,
                  hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.black.withOpacity(0.7),
                      ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: mainColor,
                    ),
                  ),
                ),
                controller: controller,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
