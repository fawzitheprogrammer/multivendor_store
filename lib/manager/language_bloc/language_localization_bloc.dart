import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multivendor_store/core/constants.dart';
part 'language_localization_event.dart';
part 'language_localization_state.dart';

class LanguageLocalizationBloc
    extends Bloc<LanguageLocalizationEvent, LanguageLocalizationState> {
  LanguageLocalizationBloc() : super(LanguageLocalizationInitial()) {
    on<LanguageLocalizationEvent>((event, emit) {
      if (event is IntialLanguage) {
        if (sharedPreferences!.getString('lang') != null) {
          switch (sharedPreferences!.getString('lang')) {
            case 'ar':
              sharedPreferences!.setString('lang', 'ar');
              emit(AppChangeLanguage('ar'));
              break;
            case 'en':
              sharedPreferences!.setString('lang', 'en');
              emit(AppChangeLanguage('en'));
              break;
            case 'ku':
              sharedPreferences!.setString('lang', 'ku');
              emit(AppChangeLanguage('ku'));
              break;
            default:
              sharedPreferences!.setString('lang', 'en');
              emit(AppChangeLanguage('en'));
              break;
          }
        } else {
          sharedPreferences!.setString('lang', 'en');
          emit(AppChangeLanguage('en'));
        }
      } else if (event is ArabicLanguage) {
        sharedPreferences!.setString('lang', 'ar');
        emit(AppChangeLanguage('ar'));
      } else if (event is EnglishLanguage) {
        sharedPreferences!.setString('lang', 'en');
        emit(AppChangeLanguage('en'));
      } else if (event is KurdishLanugage) {
        sharedPreferences!.setString('lang', 'ku');
        emit(AppChangeLanguage('ku'));
      }
    });
  }
}
