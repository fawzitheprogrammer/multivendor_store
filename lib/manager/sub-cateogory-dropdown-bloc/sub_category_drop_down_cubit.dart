import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class SubCategoryDropDownCubit extends Cubit<String?> {
  SubCategoryDropDownCubit() : super(null);

  void selectCategory(String? category) {
    emit(category);
  }
}
