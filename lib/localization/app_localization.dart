import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization({required this.locale});

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();

  late Map<String, String> jsonStrings;

  Future loadLangJson() async {
    String strings =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');

    Map<String, dynamic> jsons = json.decode(strings);

    jsonStrings = jsons.map(
      (key, value) {
        return MapEntry(key, value);
      },
    );
  }

  String translate(String key) {
    return jsonStrings[key] ?? '';
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar', 'ku'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization appLocalization = AppLocalization(locale: locale);
    await appLocalization.loadLangJson();
    return appLocalization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) => false;
}

String translate({required String key, required BuildContext context}) {
  return AppLocalization.of(context)!.translate(key);
}
