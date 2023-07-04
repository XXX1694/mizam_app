// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mizam_app/utils/translate.dart';

import '../pages/edit_phone_data.dart';

class EditPhone extends StatefulWidget {
  const EditPhone({super.key, required this.phoneController});
  final TextEditingController phoneController;

  @override
  State<EditPhone> createState() => _EditPhoneState();
}

class _EditPhoneState extends State<EditPhone> {
  late TextEditingController controller;
  String _controllerValue = '';
  @override
  void initState() {
    controller = TextEditingController();
    _controllerValue = widget.phoneController.text;
    controller.text = widget.phoneController.text;
    super.initState();
  }

  void _handleControllerValueChanged(String value) {
    setState(() {
      _controllerValue = value;
      widget.phoneController.text = _controllerValue;
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
              translation(context).phone_number,
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
            builder: (context) => EditPhoneData(
              controller: controller,
              onControllerValueChanged: _handleControllerValueChanged,
            ),
          ),
        );
      },
    );
  }
}
