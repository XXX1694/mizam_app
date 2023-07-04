// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mizam_app/features/edit_profile/presentation/pages/edit_name_data.dart';
import 'package:mizam_app/utils/translate.dart';

class EditName extends StatefulWidget {
  const EditName({
    super.key,
    required this.nameController,
  });
  final TextEditingController nameController;
  @override
  State<EditName> createState() => _EditNameState();
}

class _EditNameState extends State<EditName> {
  late TextEditingController controller;
  String _controllerValue = '';
  @override
  void initState() {
    controller = TextEditingController();
    _controllerValue = widget.nameController.text;
    controller.text = widget.nameController.text;
    super.initState();
  }

  void _handleControllerValueChanged(String value) {
    setState(() {
      _controllerValue = value;
      widget.nameController.text = _controllerValue;
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
              translation(context).full_name,
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
            builder: (context) => EditNameData(
              controller: controller,
              onControllerValueChanged: _handleControllerValueChanged,
            ),
          ),
        );
      },
    );
  }
}
