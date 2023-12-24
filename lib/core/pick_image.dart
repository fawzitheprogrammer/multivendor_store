import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multivendor_store/main.dart';

Future<XFile?> pickSingleImage() async {
  final XFile? image =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  return image;
}

// Future<List<XFile>?> pickImage({required BuildContext context}) async {
//   List<XFile>? image;
//   try {
//     final pickedImage = await ImagePicker().pickMultiImage();

//     image = pickedImage.cast<XFile>().toList();
//   } on Exception catch (e) {
//     print('[ Image Picker Exception ] --- $e');
//   }
//   return image;
// }

Future<List<File>> pickMultiImage() async {
  final pickedFile = await ImagePicker().pickMultiImage(
      imageQuality: 100, // To set quality of images
      maxHeight: 1000, // To set maxheight of images that you want in your app
      maxWidth: 1000); // To set maxheight of images that you want in your app
  List<XFile> xfilePick = pickedFile;
  List<File> selectedImages = []; // List of selected image

  // if atleast 1 images is selected it will add
  // all images in selectedImages
  // variable so that we can easily show them in UI
  if (xfilePick.isNotEmpty) {
    for (var i = 0; i < xfilePick.length; i++) {
      selectedImages.add(File(xfilePick[i].path));
    }
  } else {
    // If no image is selected it will show a
    // snackbar saying nothing is selected
    ScaffoldMessenger.of(Get.c!)
        .showSnackBar(const SnackBar(content: Text('Nothing is selected')));
  }

  return selectedImages;
}
