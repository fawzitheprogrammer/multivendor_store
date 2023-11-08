part of 'language_localization_bloc.dart';

abstract class LanguageLocalizationState {}

final class LanguageLocalizationInitial extends LanguageLocalizationState {}

final class AppChangeLanguage extends LanguageLocalizationState {
  final String languageCode;

  AppChangeLanguage(this.languageCode);
}
