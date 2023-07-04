// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizam_app/common/widgets/divider.dart';
import 'package:mizam_app/features/sub_category/presentation/bloc/sub_category_bloc.dart';

import '../../../../common/colors/main_colors.dart';
import '../../../../utils/bottom_sheet.dart';
import '../../../../utils/translate.dart';
import '../../../sub_sub_category/presentation/pages/sub_sub_categories.dart';

class SubCategoriesPage extends StatefulWidget {
  const SubCategoriesPage({
    super.key,
    required this.category_name,
    required this.sub_category_list,
  });
  final String category_name;
  final List<String> sub_category_list;
  @override
  State<SubCategoriesPage> createState() => _SubCategoriesPageState();
}

class _SubCategoriesPageState extends State<SubCategoriesPage> {
  late SubCategoryBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<SubCategoryBloc>(context);
    bloc.add(GetAllSubCategories(widget.sub_category_list));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubCategoryBloc, SubCategoryState>(
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
          child: BlocBuilder<SubCategoryBloc, SubCategoryState>(
            builder: (context, state) {
              if (state is SubCategoryGot) {
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
                                onPressed: () {
                                  if (state
                                          .sub_category_list![index].products ==
                                      null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SubSubCategoriesPage(
                                          category_name: state
                                                  .sub_category_list![index]
                                                  .name ??
                                              '',
                                          sub_category_list: state
                                                  .sub_category_list![index]
                                                  .subsub ??
                                              [],
                                        ),
                                      ),
                                    );
                                  }
                                },
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
              } else if (state is SubCategoryGetting) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: mainColor,
                    ),
                  ),
                );
              } else if (state is SubCategoryGetError) {
                return const Expanded(
                  child: Center(
                    child: Text('Error'),
                  ),
                );
              } else {
                return const Spacer();
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
        } else if (state is SubCategoryGetError) {
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
