import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

Future<File> downloadFile(String url, String filename) async {
  // Get the application documents directory.
  final directory = await getApplicationDocumentsDirectory();

  // Use the http package to download the file.
  final response = await http.get(Uri.parse(url));

  // Throw an error if the download failed.
  if (response.statusCode != 200) {
    throw Exception('Failed to download file from $url');
  }

  // Get the file path and create a file there.
  final filePath = path.join(directory.path, filename);
  final file = File(filePath);

  // Write the file.
  return file.writeAsBytes(response.bodyBytes);
}

Future<List<File>> downloadFiles(List<String> urls) async {
  List<File> files = [];

  for (var i = 0; i < urls.length; i++) {
    String url = urls[i];
    String filename = 'downloadedFile_$i.jpg'; // Naming files differently
    try {
      File file = await downloadFile(url, filename);
      files.add(file);
      print('Downloaded $url to ${file.path}');
    } catch (e) {
      print('Failed to download $url: $e');
    }
  }

  return files;
}
