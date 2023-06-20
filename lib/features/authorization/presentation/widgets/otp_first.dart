import 'package:flutter/material.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/phone_field.dart';

class OTPFirst extends StatefulWidget {
  const OTPFirst({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<OTPFirst> createState() => _OTPFirstState();
}

class _OTPFirstState extends State<OTPFirst> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 36),
        PhoneField(controller: widget.controller),
        const Spacer(),
      ],
    );
  }
}
