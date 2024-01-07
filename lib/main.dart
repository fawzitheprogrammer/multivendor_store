import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kurdish_localization/flutter_kurdish_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:multivendor_store/core/firebase/get_device_token.dart';
import 'package:multivendor_store/firebase_options.dart';
import 'package:multivendor_store/manager/authentication-bloc/authentication_bloc_bloc.dart';
import 'package:multivendor_store/manager/connection-bloc/connection_bloc.dart';
import 'package:multivendor_store/manager/category-dropdown-bloc/category_drop_down_cubit.dart';
import 'package:multivendor_store/manager/get-all-products/get_all_products_bloc.dart';
import 'package:multivendor_store/manager/get-image-from-firebase-to-update/get-image-from-firebase-to-update.dart';
import 'package:multivendor_store/manager/register-store/register_store_bloc.dart';
import 'package:multivendor_store/manager/route-cubit/route_cubit.dart';
import 'package:multivendor_store/manager/store-product/store_product_bloc.dart';
import 'package:multivendor_store/manager/sub-cateogory-dropdown-bloc/sub_category_drop_down_cubit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constants.dart';
import 'core/theme/my_custom_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/utils/app_route.dart';
import 'localization/app_localization.dart';
import 'manager/theme-bloc/theme_state.dart';
import 'manager/language_bloc/language_localization_bloc.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await NotificationService.requestPermission();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF006685),
      systemNavigationBarColor: Color(0xFF006685),
    ),
  );

  runApp(
    const AppRoot(),
  );
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    debugPrint(' --------- Device Size ------- ${MediaQuery.of(context).size}');

    return ScreenUtilInit(
      designSize: deviceSize,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LanguageLocalizationBloc()
              ..add(
                IntialLanguage(),
              ),
          ),
          BlocProvider(
            create: (context) => ThemeModeCubit(),
          ),
          BlocProvider(
            create: (context) => RouteCubit(),
          ),
          BlocProvider(
            create: (context) => AuthenticationBlocBloc(),
          ),
          BlocProvider(
            create: (context) => ConnectionBloc(),
          ),
          BlocProvider(
            create: (context) => RegisterStoreBloc(),
          ),
          BlocProvider(
            create: (context) => StoreProductBloc(),
          ),
          BlocProvider(
            create: (context) => GetAllProductsBloc(),
          ),
          BlocProvider(
            create: (context) => CategoryDropDownCubit(),
          ),
          BlocProvider(
            create: (context) => SubCategoryDropDownCubit(),
          ),
          BlocProvider(
            create: (context) => GetImageFromFirebaseToUpdateCubit(),
          ),
        ],
        child: BlocBuilder<ThemeModeCubit, bool>(
          builder: (context, themeModeCubit) =>
              BlocBuilder<LanguageLocalizationBloc, LanguageLocalizationState>(
            builder: (context, languageBloc) {
              if (languageBloc is AppChangeLanguage) {
                return MaterialApp.router(
                  locale: Locale(languageBloc.languageCode),
                  supportedLocales: const [
                    Locale('en'),
                    Locale('ku'),
                    Locale('ar'),
                  ],
                  localizationsDelegates: [
                    AppLocalization.delegate,
                    KurdishMaterialLocalizations.delegate,
                    KurdishCupertinoLocalizations.delegate,
                    KurdishWidgetLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate
                  ],
                  localeResolutionCallback: (deviceLocale, supportedLocales) {
                    for (var locale in supportedLocales) {
                      if (deviceLocale != null) {
                        if (deviceLocale.languageCode == locale.languageCode) {
                          return deviceLocale;
                        }
                      }
                    }
                    return supportedLocales.first;
                  },
                  themeMode: themeModeCubit ? ThemeMode.dark : ThemeMode.light,
                  theme: darkColorScheme,
                  darkTheme: lightColorScheme,
                  debugShowCheckedModeBanner: false,
                  routerConfig: AppRoute.routes,
                );
              }
              return MaterialApp.router(
                supportedLocales: const [
                  Locale('en'),
                  Locale('ku'),
                  Locale('ar'),
                ],
                localizationsDelegates: [
                  AppLocalization.delegate,
                  KurdishMaterialLocalizations.delegate,
                  KurdishWidgetLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null) {
                      if (deviceLocale.languageCode == locale.languageCode) {
                        return deviceLocale;
                      }
                    }
                  }
                  return supportedLocales.first;
                },
                themeMode: themeModeCubit ? ThemeMode.dark : ThemeMode.light,
                theme: lightColorScheme,
                darkTheme: lightColorScheme,
                debugShowCheckedModeBanner: false,
                routerConfig: AppRoute.routes,
              );
            },
          ),
        ),
      ),
    );
  }
}

class Get {
  static BuildContext? get c => navigatorKey.currentContext;
  static NavigatorState? get navigator => navigatorKey.currentState;
}
