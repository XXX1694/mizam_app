import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizam_app/common/widgets/main_button.dart';
import 'package:mizam_app/features/authorization/presentation/bloc/autharization_bloc.dart';
import 'package:mizam_app/common/widgets/background.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/dont_have_an_account.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/email_field.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/forgot_password.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/login_devider.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/login_via.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/password_field.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/top_side.dart';
import 'package:mizam_app/utils/bottom_sheet.dart';
import 'package:mizam_app/utils/translate.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late AutharizationBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<AutharizationBloc>(context);
    passwordController = TextEditingController();
    emailController = TextEditingController();
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
                        mainText: translation(context).sign_in_main_text,
                        secondText: translation(context).sign_in_second_text,
                        deviceHeight: deviceHeight,
                      ),
                    ),
                    const SizedBox(height: 36),
                    EmailField(controller: emailController),
                    const SizedBox(height: 20),
                    PasswordField(controller: passwordController),
                    const SizedBox(height: 12),
                    const ForgotPassword(),
                    const SizedBox(height: 40),
                    MainButton(
                      widget: Text(
                        translation(context).login,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      onPressed: () {
                        bloc.add(
                          LogIn(
                            emailAddress: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      },
                      active: true,
                    ),
                    const SizedBox(height: 32),
                    const CustomDevider(),
                    const SizedBox(height: 32),
                    const LoginVia(),
                    const Spacer(),
                    const DontHaveAnAccount(),
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
        } else if (state is UserEntering) {
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
        } else if (state is NoUserError) {
          Navigator.pop(context);
          showCustomBottomSheet(
            context,
            translation(context).no_user,
            state.message,
            'assets/icons/no_user.svg',
            translation(context).done,
          );
        } else if (state is PasswordError) {
          Navigator.pop(context);
          showCustomBottomSheet(
            context,
            translation(context).password_error,
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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
