import 'package:flutter/material.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/otp_first.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/otp_second.dart';

import '../../../../common/widgets/main_button.dart';
import '../../../../utils/translate.dart';
import '../widgets/background.dart';
import '../widgets/top_side.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({super.key});

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  late TextEditingController controller;
  bool codeSend = false;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const Background(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TopSide(
                      mainText: translation(context).otp,
                      secondText: translation(context).enter_phone,
                      deviceHeight: deviceHeight,
                    ),
                  ),
                  Expanded(
                    child: !codeSend
                        ? OTPFirst(
                            controller: controller,
                          )
                        : const OTPSecond(),
                  ),
                  MainButton(
                    widget: codeSend
                        ? Text(
                            translation(context).send_code,
                            style: Theme.of(context).textTheme.displayMedium,
                          )
                        : Text(
                            translation(context).confirm,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                    onPressed: () {
                      if (codeSend) {
                      } else {
                        setState(() {
                          codeSend = true;
                        });
                      }
                    },
                    active: true,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
