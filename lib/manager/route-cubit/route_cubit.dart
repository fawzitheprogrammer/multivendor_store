import 'package:hydrated_bloc/hydrated_bloc.dart';

class RouteCubit extends HydratedCubit<String> {
  RouteCubit() : super('/');

  void toggleTheme({required String value}) {
    emit(value);
  }

  @override
  String? fromJson(Map<String, dynamic> json) {
    return json['route'];
  }

  @override
  Map<String, dynamic>? toJson(String state) {
    return {"route": state};
  }
}
