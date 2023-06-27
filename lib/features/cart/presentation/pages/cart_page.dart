import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/not_log_in.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Column(
            children: [],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Column();
        } else {
          return const NotLogIn();
        }
      },
    );
  }
}
