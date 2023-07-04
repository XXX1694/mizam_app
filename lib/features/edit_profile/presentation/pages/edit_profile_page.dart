import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizam_app/common/widgets/main_button.dart';
import 'package:mizam_app/features/edit_profile/presentation/bloc/edit_profile_bloc.dart';
import 'package:mizam_app/features/edit_profile/presentation/widgets/edit_email.dart';
import 'package:mizam_app/features/edit_profile/presentation/widgets/edit_name.dart';
import 'package:mizam_app/features/edit_profile/presentation/widgets/edit_phone.dart';
import 'package:mizam_app/features/edit_profile/presentation/widgets/edit_photo.dart';

import '../../../../common/colors/main_colors.dart';
import '../../../../utils/bottom_sheet.dart';
import '../../../../utils/translate.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  final String name;
  final String email;
  final String phone;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late EditProfileBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<EditProfileBloc>(context);
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _nameController.text = widget.name;
    _emailController.text = widget.email;
    _phoneController.text = widget.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileBloc, EditProfileState>(
      builder: (context, state) => Scaffold(
        body: Column(
          children: [
            AppBar(
              title: Text(
                translation(context).edit_profile,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              centerTitle: true,
              backgroundColor: addColor,
              elevation: 0,
            ),
            const EditPhoto(),
            const SizedBox(height: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    EditName(nameController: _nameController),
                    EditEmail(emailController: _emailController),
                    EditPhone(phoneController: _phoneController),
                    const Spacer(),
                    MainButton(
                      widget: Text(
                        translation(context).confirm,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      onPressed: () {
                        bloc.add(
                          EditProfile(
                            email: _emailController.text,
                            name: _nameController.text,
                            number: _phoneController.text,
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
        if (state is ConnectionError) {
          Navigator.pop(context);
          showCustomBottomSheet(
            context,
            translation(context).connection_error,
            translation(context).connection_second,
            'assets/icons/connection_error.svg',
            translation(context).done,
          );
        } else if (state is ProfileEditing) {
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
        } else if (state is ProfileEdirError) {
          Navigator.pop(context);
          showCustomBottomSheet(
            context,
            translation(context).error,
            translation(context).smth,
            'assets/icons/question.svg',
            translation(context).done,
          );
        } else {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        }
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
