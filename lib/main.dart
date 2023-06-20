import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mizam_app/features/authorization/data/repositories/auth_repo.dart';
import 'package:mizam_app/features/authorization/presentation/bloc/autharization_bloc.dart';
import 'package:mizam_app/l10n/l10n.dart';

import 'package:mizam_app/theme/light_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'features/authorization/presentation/pages/forgot_password_page.dart';
import 'features/authorization/presentation/pages/login_page.dart';
import 'features/authorization/presentation/pages/otp_verification_page.dart';
import 'features/authorization/presentation/pages/registration_page.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AutharizationBloc(
              repo: AuthRepo(),
              userState: const AutharizationState(),
            ),
          ),
        ],
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
            '/': (context) => const LoginPage(),
            '/registration': (context) => const RegistraionPage(),
            '/otp_verification': (context) => const OTPVerificationPage(),
            '/forgot_password': (context) => const ForgotPasswordPage(),
          },
          initialRoute: '/',
        ),
      ),
    );
  }
}
