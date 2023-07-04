import 'package:flutter/material.dart';
import 'package:mizam_app/common/colors/main_colors.dart';

import '../../../../utils/translate.dart';

class AddressField extends StatelessWidget {
  const AddressField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.black.withOpacity(0.7),
            ),
        decoration: InputDecoration(
          hintText: translation(context).select_address,
          hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.black.withOpacity(0.7),
              ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: mainColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: mainColor70,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
        ),
        controller: controller,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
