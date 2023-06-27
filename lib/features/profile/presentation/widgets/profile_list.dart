import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mizam_app/common/widgets/divider.dart';
import 'package:mizam_app/features/authorization/presentation/bloc/autharization_bloc.dart';
import 'package:mizam_app/utils/translate.dart';

class ProfileList extends StatefulWidget {
  const ProfileList({super.key});

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
