import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizam_app/common/widgets/main_button.dart';
import 'package:mizam_app/features/authorization/presentation/bloc/autharization_bloc.dart';
import 'package:mizam_app/features/authorization/presentation/widgets/email_field.dart';

import '../../../../utils/bottom_sheet.dart';
import '../../../../utils/translate.dart';
import '../../../../common/widgets/background.dart';
import '../widgets/top_side.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController emailController;
  late AutharizationBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<AutharizationBloc>(context);
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
                        mainText: translation(context).forgot,
                        secondText: translation(context).forgot_second,
                        deviceHeight: deviceHeight,
                      ),
                    ),
                    const SizedBox(height: 36),
                    EmailField(controller: emailController),
                    const Spacer(),
                    MainButton(
                      widget:
                          BlocBuilder<AutharizationBloc, AutharizationState>(
                        builder: (context, state) {
                          if (state is ResetSending) {
                            return const Center(
                              child: SizedBox(
                                height: 35,
                                width: 35,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              ),
                            );
                          } else {
                            return Text(
                              translation(context).continuee,
                              style: Theme.of(context).textTheme.displayMedium,
                            );
                          }
                        },
                      ),
                      onPressed: () {
                        bloc.add(ResetPassword(emailController.text));
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
      ),
      listener: (context, state) {
        if (state is ConnectionError) {
          showCustomBottomSheet(
            context,
            translation(context).connection_error,
            translation(context).connection_second,
            'assets/icons/connection_error.svg',
            translation(context).done,
          );
        } else if (state is ResetSend) {
          showCustomBottomSheet2(
            context,
            translation(context).email_send,
            translation(context).reset_text,
            'assets/icons/mail.svg',
            translation(context).done,
          );
        } else if (state is ResetSendError) {
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
    super.dispose();
  }
}
