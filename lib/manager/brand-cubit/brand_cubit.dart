import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class BrandCubit extends Cubit<String?> {
  BrandCubit() : super(null);

  void setBrand(String? brand) {
    emit(brand);
  }
}

