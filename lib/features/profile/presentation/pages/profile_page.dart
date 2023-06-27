import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mizam_app/common/widgets/not_log_in.dart';
import 'package:mizam_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:mizam_app/features/profile/presentation/widgets/profile_top.dart';

import '../../../../common/colors/main_colors.dart';
import '../../../../utils/bottom_sheet.dart';
import '../../../../utils/translate.dart';
import '../widgets/profile_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<ProfileBloc>(context);
    bloc.add(GetUserData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return BlocConsumer<ProfileBloc, ProfileState>(
            builder: (context, state) => BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileDataGetting) {
                  return Center(
                    child: CircularProgressIndicator(color: mainColor),
                  );
                } else if (state is ProfileGetError) {
                  return const Center(
                    child: Text('Profile data get error'),
                  );
                } else if (state is ProfileDataGot) {
                  return Column(
                    children: [
                      AppBar(
                        title: Text(
                          translation(context).profile,
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                        centerTitle: false,
                        backgroundColor: addColor,
                        elevation: 0,
                        actions: [
                          CupertinoButton(
                            child: SvgPicture.asset(
                              'assets/icons/settings.svg',
                              height: 24,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 32),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: ProfileTop(
                                    full_name: state.model.full_name)),
                            const SizedBox(height: 32),
                            const ProfileList(),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Column();
                }
              },
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
              } else if (state is ProfileGetError) {
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
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Column();
        } else {
          return const NotLogIn();
        }
      },
    );
  }
}
