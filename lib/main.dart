import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizam_app/features/authorization/data/repositories/auth_repo.dart';
import 'package:mizam_app/features/authorization/presentation/bloc/autharization_bloc.dart';
import 'package:mizam_app/features/catalog/data/repositories/catalog_repository.dart';
import 'package:mizam_app/features/change_password/data/repositories/change_password_repo.dart';
import 'package:mizam_app/features/change_password/presentation/bloc/change_password_bloc.dart';
import 'package:mizam_app/features/edit_profile/data/repositories/edit_profile_repo.dart';
import 'package:mizam_app/features/edit_profile/presentation/bloc/edit_profile_bloc.dart';
import 'package:mizam_app/features/my_address/data/repositories/my_address_repo.dart';
import 'package:mizam_app/features/my_address/presentation/bloc/my_address_bloc.dart';
import 'package:mizam_app/features/profile/data/repositories/profile_repository.dart';
import 'package:mizam_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:mizam_app/features/settings/presentation/pages/change_language.dart';
import 'package:mizam_app/features/settings/presentation/pages/settings_page.dart';
import 'package:mizam_app/features/sub_category/data/repositories/sub_categories_repo.dart';
import 'package:mizam_app/features/sub_category/presentation/bloc/sub_category_bloc.dart';
import 'package:mizam_app/l10n/l10n.dart';
import 'package:mizam_app/l10n/language_constants.dart';
import 'package:mizam_app/main_page.dart';

import 'package:mizam_app/theme/light_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'features/authorization/presentation/pages/forgot_password_page.dart';
import 'features/authorization/presentation/pages/login_page.dart';
import 'features/authorization/presentation/pages/otp_verification_page.dart';
import 'features/authorization/presentation/pages/registration_page.dart';
import 'features/catalog/presentation/bloc/catalog_bloc.dart';
import 'features/change_password/presentation/pages/change_password.dart';

import 'features/my_address/presentation/pages/add_address.dart';
import 'features/notification/presentation/pages/notification_page.dart';
import 'features/sub_sub_category/data/repositories/sub_sub_categories_repo.dart';
import 'features/sub_sub_category/presentation/bloc/sub_sub_category_bloc.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((value) => setLocale(value));
    super.didChangeDependencies();
  }

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
          BlocProvider(
            create: (context) => CatalogBloc(
              repo: CatalogRepository(),
              catalogState: const CatalogState(),
            ),
          ),
          BlocProvider(
            create: (context) => SubCategoryBloc(
              repo: SubCategoryRepository(),
              subCategoryState: const SubCategoryState(),
            ),
          ),
          BlocProvider(
            create: (context) => SubSubCategoryBloc(
              repo: SubSubCategoryRepository(),
              subCategoryState: const SubSubCategoryState(),
            ),
          ),
          BlocProvider(
            create: (context) => ProfileBloc(
              repo: ProfileRepository(),
              profileState: const ProfileState(),
            ),
          ),
          BlocProvider(
            create: (context) => ChangePasswordBloc(
              repo: ChangePasswordRepo(),
              changePasswordState: const ChangePasswordState(),
            ),
          ),
          BlocProvider(
            create: (context) => EditProfileBloc(
              repo: EditProfileRepository(),
              editProfileState: const EditProfileState(),
            ),
          ),
          BlocProvider(
            create: (context) => MyAddressBloc(
              repo: MyAddressRepo(),
              myAddressState: const MyAddressState(),
            ),
          )
        ],
        child: MaterialApp(
          title: 'Mizam App',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          locale: _locale,
          supportedLocales: L10n.all,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          routes: {
            '/': (context) => const MainPage(),
            '/login': (context) => const LoginPage(),
            '/registration': (context) => const RegistraionPage(),
            '/otp_verification': (context) => const OTPVerificationPage(),
            '/forgot_password': (context) => const ForgotPasswordPage(),
            '/settings': (context) => const SettingsPage(),
            '/change_password': (context) => const ChangePasswordPage(),
            '/language': (context) => const LanguagePage(),
            '/add_address': (context) => const AddAddressPage(),
            '/notification': (context) => const NotifcationPage(),
          },
          initialRoute: '/',
        ),
      ),
    );
  }
}
