// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mizam_app/utils/translate.dart';

import '../pages/edit_email_data.dart';

class EditEmail extends StatefulWidget {
  const EditEmail({super.key, required this.emailController});
  final TextEditingController emailController;

  @override
  State<EditEmail> createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
  late TextEditingController controller;
  String _controllerValue = '';
  @override
  void initState() {
    controller = TextEditingController();
    _controllerValue = widget.emailController.text;
    controller.text = widget.emailController.text;
    super.initState();
  }

  void _handleControllerValueChanged(String value) {
    setState(() {
      _controllerValue = value;
      widget.emailController.text = _controllerValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              translation(context).email,
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontFamily: 'Gilroy',
                fontSize: 18,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Text(
              _controllerValue,
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontFamily: 'Gilroy',
                fontSize: 18,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 12),
            SvgPicture.asset('assets/icons/right_arrow.svg', height: 12),
          ],
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditEmailData(
              controller: controller,
              onControllerValueChanged: _handleControllerValueChanged,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
