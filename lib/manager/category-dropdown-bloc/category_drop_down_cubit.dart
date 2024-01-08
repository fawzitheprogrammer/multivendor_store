import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class CategoryDropDownCubit extends Cubit<String?> {
  CategoryDropDownCubit() : super(null);

  void selectCategory(String? category) {
    emit(category);
  }
}
