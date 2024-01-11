import 'package:multivendor_store/core/check_if_user_is_connected.dart';

import 'exports/exports.dart';

extension BuildContextExtensions<T> on BuildContext {
  // Getting current language

  /// Text Styles

  TextStyle? get regular => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 14.sp,
        fontFamily: sharedPreferences!.getString('lang') == 'en'
            ? 'Metropolis-Regular'
            : 'NRT-Reg',
      );

  TextStyle? get medium => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 16.sp,
        fontFamily: sharedPreferences!.getString('lang') == 'en'
            ? 'Metropolis-SemiBold'
            : 'NRT-Reg',
      );

  TextStyle? get semiBold => Theme.of(this).textTheme.bodyLarge!.copyWith(
        fontSize: 24.sp,
        fontFamily: sharedPreferences!.getString('lang') == 'en'
            ? 'Metropolis-SemiBold'
            : 'NRT-Reg',
      );

  TextStyle? get bold => Theme.of(this).textTheme.bodyLarge!.copyWith(
      fontSize: 34.sp,
      fontFamily: sharedPreferences!.getString('lang') == 'en'
          ? 'Metropolis-Bold'
          : 'NRT-Bol');

  // Color Scheme
  ColorScheme? get colorScheme => Theme.of(this).colorScheme;

  // MediaQuery
  Size get mediaQuery => MediaQuery.of(this).size;

  // screen width
  bool get isWidthLessThan500 => MediaQuery.of(this).size.width <= 500;


  // get the language code
  String get languageCode => sharedPreferences!.getString('lang')!;


  // If device network has acccess to interter this value return true
  Future<bool> get hasInternet async =>
      await checkInternetAccess().then((value) => value);
}
