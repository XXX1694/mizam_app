import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mizam_app/common/colors/main_colors.dart';
import 'package:mizam_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:mizam_app/utils/translate.dart';

import '../../../../common/widgets/divider.dart';

void showAddress(
  BuildContext context,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return const AddressList();
    },
  );
}

class AddressList extends StatefulWidget {
  const AddressList({super.key});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  late ProfileBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<ProfileBloc>(context);
    bloc.add(GetUserData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      ),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileDataGot) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      translation(context).location1,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Gilroy',
                        fontSize: 24,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.model.address?.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/icons/address.svg',
                                      height: 21,
                                      // ignore: deprecated_member_use
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 21),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Home',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Gilroy',
                                        fontSize: 18,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      state.model.address![index],
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Gilroy',
                                        fontSize: 14,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              child: CustomDivider(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: CupertinoButton(
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          translation(context).add_address_new,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Gilroy',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/add_address');
                        },
                      ),
                    ),
                    // const SizedBox(height: 12),
                  ],
                ),
              ),
            );
          } else if (state is ProfileGetError) {
            return const Center(child: Text('Enter to your account'));
          } else if (state is ProfileDataGetting) {
            return Center(
              child: CircularProgressIndicator(color: mainColor),
            );
          } else {
            return const Center(child: Text('Enter to your account'));
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
