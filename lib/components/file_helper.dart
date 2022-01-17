import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileHelper {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  Future<File> writeFile(String data) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(data);
  }

  Future<String> readFile() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      return 'null';
    }
  }
}
