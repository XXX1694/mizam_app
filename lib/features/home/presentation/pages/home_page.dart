import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizam_app/common/colors/main_colors.dart';
import 'package:mizam_app/common/widgets/background_short.dart';
import 'package:mizam_app/common/widgets/divider.dart';
import 'package:mizam_app/features/catalog/presentation/bloc/catalog_bloc.dart';
import 'package:mizam_app/features/home/presentation/widgets/corusel.dart';
import 'package:mizam_app/features/home/presentation/widgets/in_trend.dart';
import 'package:mizam_app/features/home/presentation/widgets/mini_catalog.dart';
import 'package:mizam_app/features/home/presentation/widgets/watched_recently.dart';

import '../widgets/change_language.dart';
import '../widgets/change_location.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CatalogBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<CatalogBloc>(context);
    bloc.add(GetAllCategory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        if (state is CatalogGot) {
          return Scrollbar(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: BackgroundShort(height: screenHeight),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 63),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ChangeLocation(),
                            ChangeLanguage(),
                          ],
                        ),
                      ),
                      const CustomCarousel(),
                      const SizedBox(height: 24),
                      const CustomDivider(),
                      const SizedBox(height: 12),
                      MiniCatalog(
                        categoryList: state.category_list,
                      ),
                      const SizedBox(height: 12),
                      const CustomDivider(),
                      const WatchedRecently(),
                      const SizedBox(height: 12),
                      const CustomDivider(),
                      const InTrend(),
                      const SizedBox(height: 103),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: mainColor),
            ),
          );
        }
      },
    );
  }
}
