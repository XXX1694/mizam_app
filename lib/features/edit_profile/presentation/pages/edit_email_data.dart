import 'package:flutter/material.dart';

import '../../../../common/colors/main_colors.dart';
import '../../../../common/widgets/main_button.dart';
import '../../../../utils/translate.dart';

class EditEmailData extends StatelessWidget {
  const EditEmailData({
    super.key,
    required this.controller,
    required this.onControllerValueChanged,
  });

  final TextEditingController controller;
  final Function(String) onControllerValueChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translation(context).email,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        backgroundColor: addColor,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 24),
              SizedBox(
                height: 54,
                width: double.infinity,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black.withOpacity(0.7),
                      ),
                  decoration: InputDecoration(
                    hintText: controller.text,
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
                  onChanged: (value) {
                    onControllerValueChanged(value);
                  },
                  controller: controller,
                  keyboardType: TextInputType.name,
                ),
              ),
              const Spacer(),
              MainButton(
                widget: Text(
                  translation(context).save,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                active: true,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
