// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mizam_app/common/widgets/divider.dart';
import 'package:mizam_app/features/authorization/data/models/user.dart';
import 'package:mizam_app/features/authorization/presentation/bloc/autharization_bloc.dart';
import 'package:mizam_app/features/edit_profile/presentation/pages/edit_profile_page.dart';
import 'package:mizam_app/features/my_address/presentation/pages/my_addresses.dart';
import 'package:mizam_app/utils/translate.dart';

class ProfileList extends StatefulWidget {
  const ProfileList({super.key, required this.user_data});
  final UserModel user_data;
  @override
  State<ProfileList> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  late AutharizationBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<AutharizationBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              const CustomDivider(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        translation(context).edit_profile,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Gilroy',
                          fontSize: 22,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SvgPicture.asset('assets/icons/right_arrow.svg',
                        height: 12),
                  ],
                ),
              ),
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfilePage(
                  name: widget.user_data.full_name ?? '',
                  email: widget.user_data.email ?? '',
                  phone: widget.user_data.phone_number ?? '',
                ),
              ),
            );
          },
        ),
        CupertinoButton(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              const CustomDivider(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        translation(context).change_password,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Gilroy',
                          fontSize: 22,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SvgPicture.asset('assets/icons/right_arrow.svg',
                        height: 12),
                  ],
                ),
              ),
            ],
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/change_password');
          },
        ),
        CupertinoButton(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              const CustomDivider(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        translation(context).my_orders,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Gilroy',
                          fontSize: 22,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SvgPicture.asset('assets/icons/right_arrow.svg',
                        height: 12),
                  ],
                ),
              ),
            ],
          ),
          onPressed: () {},
        ),
        CupertinoButton(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              const CustomDivider(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        translation(context).my_address,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Gilroy',
                          fontSize: 22,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SvgPicture.asset('assets/icons/right_arrow.svg',
                        height: 12),
                  ],
                ),
              ),
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyAddress(
                  user_address: widget.user_data.address ?? [],
                ),
              ),
            );
          },
        ),
        CupertinoButton(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              const CustomDivider(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        translation(context).exit,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Color(0XFFEA4335),
                          fontFamily: 'Gilroy',
                          fontSize: 22,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          onPressed: () {
            bloc.add(LogOut());
          },
        ),
      ],
    );
  }
}
