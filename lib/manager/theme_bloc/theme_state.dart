import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeModeCubit extends HydratedCubit<bool> {
  ThemeModeCubit() : super(false);

  void toggleTheme({required bool value}) {
    emit(value);
  }

  @override
  bool? fromJson(Map<String, dynamic> json) {
    return json['isDark'];
  }

  @override
  Map<String, dynamic>? toJson(bool state) {
    return {"isDark": state};
  }
}
