import 'dart:io';

import 'package:flutter_dependency_injection/utils/decoration_character.dart';
import 'package:flutter_dependency_injection/utils/text_util.dart';
import 'package:path_provider/path_provider.dart';

class FileTextUtil implements TextUtil {
  DecorationCharacter? _decorationCharacter;

  FileTextUtil(DecorationCharacter decorationCharacter) {
    _decorationCharacter = decorationCharacter;
  }

  @override
  void save(text) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/hoge.txt');

    // ファイルがなかったら生成する
    if (!await file.exists()) {
      await file.create();
    }
    await file.writeAsString(text);
  }

  @override
  Future<String> read() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/hoge.txt');

    // ファイルがあった時だけ読み込む
    if (await file.exists()) {
      final dataTmp = await file.readAsString();
      final decorationCharacter = _decorationCharacter?.getDecoration();
      final data = '$decorationCharacter$dataTmp$decorationCharacter';
      return data;
    }

    return '';
  }
}