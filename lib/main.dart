import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mizam_app/l10n/l10n.dart';

import 'package:mizam_app/theme/light_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'features/authorization/presentation/pages/forgot_password_page.dart';
import 'features/authorization/presentation/pages/login_page.dart';
import 'features/authorization/presentation/pages/otp_verification_page.dart';
import 'features/authorization/presentation/pages/registration_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [],
      child: MaterialApp(
        title: 'Mizam App',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        routes: {
          '/authorization/login': (context) => const LoginPage(),
          '/authorization/registration': (context) => const RegistraionPage(),
          '/authorization/otp_verification': (context) =>
              const OTPVerificationPage(),
          '/authorization/forgot_password': (context) =>
              const ForgotPasswordPage(),
        },
        initialRoute: '/authorization/login',
      ),
    );
  }
}
