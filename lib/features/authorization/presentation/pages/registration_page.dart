import 'package:flutter/material.dart';
import 'package:mizam_app/common/widgets/main_button.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/email_field.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/full_name_field.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/i_have_account.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/password_field.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/top_side.dart';
import 'package:mizam_app/utils/translate.dart';

import '../widgets/background.dart';

class RegistraionPage extends StatefulWidget {
  const RegistraionPage({super.key});

  @override
  State<RegistraionPage> createState() => _RegistraionPageState();
}

class _RegistraionPageState extends State<RegistraionPage> {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
                      mainText: translation(context).register,
                      secondText: translation(context).create_acc,
                      deviceHeight: deviceHeight,
                    ),
                  ),
                  const SizedBox(height: 36),
                  FullNameField(controller: fullNameController),
                  const SizedBox(height: 20),
                  EmailField(controller: emailController),
                  const SizedBox(height: 20),
                  PasswordField(controller: passwordController),
                  const Spacer(),
                  MainButton(
                    widget: Text(
                      translation(context).register,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/otp_verification');
                    },
                    active: true,
                  ),
                  const SizedBox(height: 40),
                  const IHaveAccount(),
                  const SizedBox(height: 8),
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
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
