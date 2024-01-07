import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../core/firebase/download_file.dart';

class GetImageFromFirebaseToUpdateCubit extends Cubit<List<File>?> {
  GetImageFromFirebaseToUpdateCubit() : super(null);

  List<File> imagePath = [];

  void getImages(
    List<String> urls,
  ) async {
    if (imagePath.isEmpty) {
      imagePath = await downloadFiles(urls);
      emit(imagePath);
    }
  }
}
