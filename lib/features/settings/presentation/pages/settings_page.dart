import 'package:flutter/material.dart';
import 'package:mizam_app/features/settings/presentation/widgets/settings_list.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingsList(),
    );
  }
}
