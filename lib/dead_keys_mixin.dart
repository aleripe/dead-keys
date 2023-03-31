import 'package:dead_keys/key_map.dart';
import 'package:dead_keys/string_extensions.dart';
import 'package:dead_keys/text_with_position.dart';

mixin DeadKeysMixin {
  late KeyMap keyMap;

  String? _deadKey;

  TextWithPosition? manageDeadKey(
    TextWithPosition oldTextWithPosition,
    String inserted,
  ) {
    if (inserted.length != 1) {
      throw ArgumentError('Invalid inserted length (only 1 allowed).');
    }

    if (_deadKey == null && keyMap.containsKey(inserted)) {
      _deadKey = inserted;
      return TextWithPosition(
        oldTextWithPosition.text,
        oldTextWithPosition.position - 1,
      );
    }

    if (_deadKey != null && keyMap.containsKey(_deadKey)) {
      final map = keyMap[_deadKey]!;

      if (map.containsKey(inserted)) {
        _deadKey = null;
        return TextWithPosition(
          oldTextWithPosition.text.insert(
            map[inserted]!,
            oldTextWithPosition.position - 1,
          ),
          oldTextWithPosition.position,
        );
      }
    }

    if (_deadKey != null) {
      final newTextWithPosition = TextWithPosition(
        oldTextWithPosition.text.insert(
          _deadKey! + inserted,
          oldTextWithPosition.position,
        ),
        oldTextWithPosition.position + _deadKey!.length,
      );

      _deadKey = null;
      return newTextWithPosition;
    }

    return null;
  }
}
