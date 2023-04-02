import 'package:dead_keys/key_map.dart';

mixin DeadKeysMixin {
  late KeyMap keyMap;

  String? _deadKey;

  String handleKey(String key) {
    if (key.length != 1) {
      throw ArgumentError('Invalid inserted length (only 1 allowed).');
    }

    if (_deadKey == null) {
      if (keyMap.containsKey(key)) {
        _deadKey = key;
        key = '';
      }
    } else {
      if (keyMap.containsKey(_deadKey)) {
        final map = keyMap[_deadKey]!;
        if (map.containsKey(key)) {
          key = map[key]!;
        } else {
          key = _deadKey! + key;
        }
      }
      _deadKey = null;
    }

    return key;
  }
}
