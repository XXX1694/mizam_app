import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizam_app/common/colors/main_colors.dart';

import 'package:mizam_app/features/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:mizam_app/features/catalog/presentation/widgets/search.dart';
import 'package:mizam_app/utils/translate.dart';

import '../../../../utils/bottom_sheet.dart';
import '../widgets/items.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  late CatalogBloc bloc;
  late TextEditingController controller;
  @override
  void initState() {
    bloc = BlocProvider.of<CatalogBloc>(context);
    // ignore: invalid_use_of_visible_for_testing_member
    bloc.emit(CatalogInitial());
    bloc.add(GetAllCategory());
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<CatalogBloc, CatalogState>(
      builder: (context, state) => Column(
        children: [
          AppBar(
            title: Text(
              translation(context).catalog,
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
            ),
            centerTitle: false,
            backgroundColor: addColor,
          ),
          BlocBuilder<CatalogBloc, CatalogState>(
            builder: (context, state) {
              if (state is CatalogGetting) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: mainColor,
                    ),
                  ),
                );
              } else if (state is CatalogGetError) {
                return const Expanded(
                  child: Center(child: Text('error')),
                );
              } else if (state is CatalogGot) {
                return Expanded(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        children: [
                          SearchField(controller: controller),
                          Items(
                            screenHeight: screenHeight,
                            categoryList: state.category_list,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return const Spacer();
              }
            },
          ),
        ],
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
        } else if (state is CatalogGetError) {
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
}
