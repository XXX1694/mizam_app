import 'package:flutter/material.dart';
import 'package:mizam_app/common/widgets/main_button.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/email_field.dart';

import '../../../../utils/translate.dart';
import '../widgets/background.dart';
import '../widgets/top_side.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController emailController;
  @override
  void initState() {
    emailController = TextEditingController();
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
                      mainText: translation(context).forgot,
                      secondText: translation(context).forgot_second,
                      deviceHeight: deviceHeight,
                    ),
                  ),
                  const SizedBox(height: 36),
                  EmailField(controller: emailController),
                  const Spacer(),
                  MainButton(
                    widget: Text(
                      translation(context).continuee,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    onPressed: () {},
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
    emailController.dispose();
    super.dispose();
  }
}
