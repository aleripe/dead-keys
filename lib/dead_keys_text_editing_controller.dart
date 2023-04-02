import 'package:dead_keys/dead_keys_mixin.dart';
import 'package:dead_keys/key_map.dart';
import 'package:flutter/widgets.dart';

import 'diff.dart';

class DeadKeysTextEditingController extends TextEditingController
    with DeadKeysMixin {
  DeadKeysTextEditingController({required KeyMap keyMap}) {
    this.keyMap = keyMap;
  }

  @override
  set value(TextEditingValue newValue) {
    String oldText = value.text;
    String newText = newValue.text;
    int position = newValue.selection.end;

    final diff = getDiff(oldText, newText, position);

    if (diff.inserted.length == 1) {
      String handledKey = handleKey(diff.inserted);
      super.value = value.copyWith(
        text: oldText + handledKey,
        selection: value.selection.copyWith(
          baseOffset: value.selection.baseOffset + handledKey.length,
          extentOffset: value.selection.baseOffset + handledKey.length,
        ),
      );
      return;
    }

    super.value = newValue;
  }
}
