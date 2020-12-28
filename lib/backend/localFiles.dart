import 'dart:io';

import 'package:path_provider/path_provider.dart';

class LocalFiles {
  static Future<File> _localFile(String name) async {
    final path = await getApplicationDocumentsDirectory();
    return File('$path/$name');
  }

  static Future<String> readFile(String name) async {
    try {
      final file = await _localFile(name);
      String content = await file.readAsString();
      return content;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<File> writeFile(String name, String contents) async {
    try {
      final file = await _localFile(name);
      return await file.writeAsString(contents);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
