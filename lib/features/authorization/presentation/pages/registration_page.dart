import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizam_app/common/widgets/main_button.dart';
import 'package:mizam_app/features/authorization/presentation/bloc/autharization_bloc.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/email_field.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/full_name_field.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/i_have_account.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/password_field.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/top_side.dart';
import 'package:mizam_app/utils/translate.dart';

import '../../../../common/colors/main_colors.dart';
import '../../../../utils/bottom_sheet.dart';
import '../../../../common/widgets/background.dart';

class RegistraionPage extends StatefulWidget {
  const RegistraionPage({super.key});

  @override
  State<RegistraionPage> createState() => _RegistraionPageState();
}

class _RegistraionPageState extends State<RegistraionPage> {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late AutharizationBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<AutharizationBloc>(context);
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AutharizationBloc, AutharizationState>(
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Background(height: deviceHeight),
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
                        bloc.add(
                          Register(
                            emailAddress: emailController.text,
                            password: passwordController.text,
                            fullName: fullNameController.text,
                          ),
                        );
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
      ),
      listener: (context, state) {
        if (state is UserOnline) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        } else if (state is UserCreating) {
          showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            },
          );
        } else if (state is ConnectionError) {
          Navigator.pop(context);
          showCustomBottomSheet(
            context,
            translation(context).connection_error,
            translation(context).connection_second,
            'assets/icons/connection_error.svg',
            translation(context).done,
          );
        } else if (state is UserExist) {
          Navigator.pop(context);
          showCustomBottomSheet(
            context,
            translation(context).user_exist,
            state.message,
            'assets/icons/no_user.svg',
            translation(context).done,
          );
        } else if (state is PasswordWeak) {
          Navigator.pop(context);
          showCustomBottomSheet(
            context,
            translation(context).weak_password,
            state.message,
            'assets/icons/no_password.svg',
            translation(context).done,
          );
        } else if (state is OtherError) {
          Navigator.pop(context);
          showCustomBottomSheet(
            context,
            translation(context).error,
            translation(context).smth,
            'assets/icons/question.svg',
            translation(context).done,
          );
        }
      },
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
