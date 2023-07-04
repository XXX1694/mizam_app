import 'package:flutter/material.dart';

import '../../../../common/colors/main_colors.dart';
import '../../../../utils/translate.dart';

class NotifcationPage extends StatelessWidget {
  const NotifcationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translation(context).notification,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        backgroundColor: addColor,
        elevation: 0,
      ),
      body: const SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
