import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizam_app/common/widgets/main_button.dart';
import 'package:mizam_app/features/change_password/presentation/bloc/change_password_bloc.dart';

import '../../../../common/colors/main_colors.dart';
import '../../../../utils/bottom_sheet.dart';
import '../../../../utils/translate.dart';
import '../widgets/new_password_field.dart';
import '../widgets/old_password_field.dart';
import '../widgets/repeat_password_field.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late TextEditingController _oldController;
  late TextEditingController _newController;
  late TextEditingController _repeatController;
  late ChangePasswordBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<ChangePasswordBloc>(context);
    _oldController = TextEditingController();
    _newController = TextEditingController();
    _repeatController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
      builder: (context, state) => Scaffold(
        body: Column(
          children: [
            AppBar(
              title: Text(
                translation(context).change_password,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              centerTitle: true,
              backgroundColor: addColor,
              elevation: 0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    OldPasswordField(controller: _oldController),
                    const SizedBox(height: 20),
                    NewPasswordField(controller: _newController),
                    const SizedBox(height: 20),
                    RepeatPasswordField(controller: _repeatController),
                    const Spacer(),
                    MainButton(
                      widget: Text(
                        translation(context).change,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      onPressed: () {
                        bloc.add(
                          ChangePassword(
                            newPassword: _newController.text,
                            oldPassword: _oldController.text,
                          ),
                        );
                      },
                      active: true,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      listener: (context, state) {
        if (state is PasswordChangingError) {
          Navigator.pop(context);
          showCustomBottomSheet(
            context,
            translation(context).error,
            translation(context).smth,
            'assets/icons/question.svg',
            translation(context).done,
          );
        } else if (state is PasswordChanged) {
          Navigator.pop(context);
          showCustomBottomSheet1(
            context,
            translation(context).password_changed,
            translation(context).password_changed_successfully,
            'assets/icons/no_password.svg',
            translation(context).done,
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
        } else if (state is PasswordChanging) {
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
        }
      },
    );
  }
}
