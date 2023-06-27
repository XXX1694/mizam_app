import 'package:flutter/material.dart';
import 'package:mizam_app/common/widgets/main_button.dart';

import '../../utils/translate.dart';

class NotLogIn extends StatelessWidget {
  const NotLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                translation(context).no_auth_text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.black.withOpacity(0.7),
                    ),
              ),
            ),
          ),
          MainButton(
            widget: Text(
              translation(context).log_in_now,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            active: true,
          ),
          const SizedBox(height: 103),
        ],
      ),
    );
  }
}
