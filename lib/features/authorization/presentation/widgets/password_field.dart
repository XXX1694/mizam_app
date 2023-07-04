// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mizam_app/common/colors/main_colors.dart';

import '../../../../utils/translate.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _showEye = false;
  bool _passwordEncrypted = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: TextFormField(
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Colors.black.withOpacity(0.7),
            ),
        decoration: InputDecoration(
          suffixIcon: _showEye
              ? GestureDetector(
                  child: _passwordEncrypted
                      ? Container(
                          height: 20,
                          width: 20,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/eye_closed.svg',
                            width: 20,
                            color: mainColor,
                          ),
                        )
                      : Container(
                          height: 2,
                          width: 20,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/eye_open.svg',
                            width: 20,
                            color: mainColor,
                          ),
                        ),
                  onTap: () {
                    setState(() {
                      _passwordEncrypted = !_passwordEncrypted;
                    });
                  },
                )
              : null,
          label: Text(translation(context).password),
          labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.black.withOpacity(0.7),
              ),
          fillColor: Colors.white,
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
        controller: widget.controller,
        keyboardType: TextInputType.visiblePassword,
        obscureText: _showEye ? _passwordEncrypted : true,
        onChanged: (enteredPassword) {
          if (enteredPassword.isEmpty) {
            setState(() {
              _showEye = false;
            });
          } else {
            if (!_showEye) {
              setState(() {
                _showEye = !_showEye;
              });
            }
          }
        },
      ),
    );
  }
}
