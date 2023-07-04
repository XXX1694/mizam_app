// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizam_app/common/widgets/divider.dart';

import '../../../../common/colors/main_colors.dart';
import '../../../../utils/bottom_sheet.dart';
import '../../../../utils/translate.dart';
import '../bloc/sub_sub_category_bloc.dart';

class SubSubCategoriesPage extends StatefulWidget {
  const SubSubCategoriesPage({
    super.key,
    required this.category_name,
    required this.sub_category_list,
  });
  final String category_name;
  final List<String> sub_category_list;
  @override
  State<SubSubCategoriesPage> createState() => _SubSubCategoriesPageState();
}

class _SubSubCategoriesPageState extends State<SubSubCategoriesPage> {
  late SubSubCategoryBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<SubSubCategoryBloc>(context);
    bloc.add(GetAllSubSubCategories(widget.sub_category_list));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubSubCategoryBloc, SubSubCategoryState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: addColor,
          title: Text(
            widget.category_name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          elevation: 0,
          leading: BackButton(onPressed: () {
            Navigator.pop(context);
          }),
        ),
        body: SafeArea(
          child: BlocBuilder<SubSubCategoryBloc, SubSubCategoryState>(
            builder: (context, state) {
              if (state is SubSubCategoryGot) {
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.sub_category_list?.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 16, 20, 16),
                              child: CupertinoButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.sub_category_list?[index].name ??
                                          '',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Gilroy',
                                        fontSize: 20,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const CustomDivider(),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is SubSubCategoryGetting) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: mainColor,
                    ),
                  ),
                );
              } else if (state is SubSubCategoryGetError) {
                return const Expanded(
                  child: Center(
                    child: Text('Error'),
                  ),
                );
              } else {
                return const Column(
                  children: [],
                );
              }
            },
          ),
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
        } else if (state is SubSubCategoryGetError) {
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
