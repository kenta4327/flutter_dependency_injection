import 'package:flutter_dependency_injection/utils/decoration_character.dart';

class DecorationCharacterStar implements DecorationCharacter {
  final _decorationCharacter = '☆☆';

  @override
  String getDecoration() {
    return _decorationCharacter;
  }
}