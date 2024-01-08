import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class HasSizeCubit extends Cubit<bool> {
  HasSizeCubit() : super(false);

  void setHasSize(bool hasSize) {
    emit(hasSize);
  }
}
