import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mizam_app/common/widgets/main_button.dart';
import 'package:mizam_app/features/my_address/presentation/bloc/my_address_bloc.dart';
import 'package:mizam_app/features/my_address/presentation/widgets/choose_address_field.dart';
import 'package:mizam_app/features/profile/presentation/bloc/profile_bloc.dart';

import '../../../../common/colors/main_colors.dart';
import '../../../../utils/bottom_sheet.dart';
import '../../../../utils/translate.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  // late TextEditingController _countryController;
  late TextEditingController _addressController;
  late MyAddressBloc bloc;
  late ProfileBloc bloc1;
  @override
  void initState() {
    bloc = BlocProvider.of<MyAddressBloc>(context);
    bloc1 = BlocProvider.of<ProfileBloc>(context);
    // _countryController = TextEditingController();
    _addressController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyAddressBloc, MyAddressState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              translation(context).add_address,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
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
                  // CountryField(controller: _countryController),
                  // const SizedBox(height: 16),
                  AddressField(controller: _addressController),
                  const SizedBox(height: 28),
                  MainButton(
                    widget: Text(
                      translation(context).save,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    onPressed: () {
                      bloc.add(
                        AddAddress(_addressController.text),
                      );
                    },
                    active: true,
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/images/address.svg'),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is ConnectionError1) {
          showCustomBottomSheet(
            context,
            translation(context).connection_error,
            translation(context).connection_second,
            'assets/icons/connection_error.svg',
            translation(context).done,
          );
        } else if (state is AddressAddError) {
          showCustomBottomSheet(
            context,
            translation(context).error,
            translation(context).smth,
            'assets/icons/question.svg',
            translation(context).done,
          );
        } else if (state is AddressAdded) {
          bloc1.add(GetUserData());
          Navigator.pop(context);
        }
      },
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }
}
