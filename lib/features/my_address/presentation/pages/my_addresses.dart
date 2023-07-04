// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mizam_app/common/widgets/divider.dart';
import 'package:mizam_app/common/widgets/main_button.dart';
import 'package:mizam_app/features/my_address/presentation/bloc/my_address_bloc.dart';
import 'package:mizam_app/features/profile/presentation/bloc/profile_bloc.dart';

import '../../../../common/colors/main_colors.dart';
import '../../../../utils/translate.dart';

class MyAddress extends StatefulWidget {
  const MyAddress({super.key, required this.user_address});
  final List<String> user_address;

  @override
  State<MyAddress> createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  List<bool> selected = [];
  bool edit_mode = false;
  late MyAddressBloc bloc;
  late ProfileBloc bloc1;
  @override
  void initState() {
    bloc = BlocProvider.of<MyAddressBloc>(context);
    bloc1 = BlocProvider.of<ProfileBloc>(context);
    bloc1.add(GetUserData());
    // ignore: unused_local_variable
    for (int i = 0; i < widget.user_address.length; i++) {
      selected.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state1) {
        if (state1 is ProfileDataGot) {
          return BlocConsumer<MyAddressBloc, MyAddressState>(
            builder: (context, state) => Scaffold(
              appBar: AppBar(
                title: Text(
                  translation(context).my_address,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                leading: edit_mode
                    ? TextButton(
                        onPressed: () {
                          List<String> to_delete = [];
                          for (int i = 0; i < widget.user_address.length; i++) {
                            if (selected[i] == true) {
                              to_delete.add(widget.user_address[i]);
                            }
                          }
                          bloc.add(DeleteAddress(to_delete));
                        },
                        child: const Text(
                          'Delete',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Gilroy',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : const BackButton(),
                leadingWidth: 80,
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        edit_mode = !edit_mode;
                      });
                    },
                    child: edit_mode
                        ? const Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.blue,
                              fontFamily: 'Gilroy',
                              fontSize: 18,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : const Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Gilroy',
                              fontSize: 18,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ],
                centerTitle: true,
                backgroundColor: addColor,
                elevation: 0,
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state1.model.address?.length ?? 0,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Column(
                            children: [
                              Row(
                                children: [
                                  edit_mode
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: IconButton(
                                              padding: const EdgeInsets.all(0),
                                              onPressed: () {
                                                setState(() {
                                                  selected[index] =
                                                      !selected[index];
                                                });
                                              },
                                              icon: selected[index] == true
                                                  ? SvgPicture.asset(
                                                      'assets/icons/selected.svg')
                                                  : SvgPicture.asset(
                                                      'assets/icons/not_selected.svg'),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  SvgPicture.asset(
                                    'assets/icons/address.svg',
                                    height: 26,
                                  ),
                                  const SizedBox(width: 21),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Home',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge
                                            ?.copyWith(color: Colors.black),
                                      ),
                                      Text(
                                        state1.model.address![index],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Gilroy',
                                          fontSize: 16,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  SvgPicture.asset('assets/icons/more.svg',
                                      height: 24),
                                ],
                              ),
                              const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  child: CustomDivider()),
                            ],
                          ),
                        ),
                      ),
                      MainButton(
                        widget: Text(
                          translation(context).add_address_new,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/add_address');
                        },
                        active: true,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            listener: (context, state) {
              if (state is AddressDeleted) {
                bloc1.add(GetUserData());
              }
            },
          );
        } else if (state1 is ProfileDataGetting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: addColor),
            ),
          );
        } else if (state1 is ProfileGetError) {
          return const Scaffold(
            body: Center(child: Text('Error')),
          );
        } else {
          return const Scaffold(
            body: Center(child: Text('Error')),
          );
        }
      },
    );
  }
}
