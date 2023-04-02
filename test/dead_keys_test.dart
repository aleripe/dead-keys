import 'package:dead_keys/dead_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Inserting multiple characters should ignore dead keys', () {
    final keyMap = {
      'm': {'m': 'n'}
    };
    final controller = DeadKeysTextEditingController(keyMap: keyMap);
    controller.value = const TextEditingValue(
      text: 'Dummy',
      selection: TextSelection.collapsed(offset: 5),
    );

    expect(controller.text, 'Dummy');
  });

  test('Inserting single dead key should preserve text', () {
    final keyMap = {
      'm': {'m': 'n'}
    };
    final controller = DeadKeysTextEditingController(keyMap: keyMap);
    controller.value = const TextEditingValue(
      text: 'Du',
      selection: TextSelection.collapsed(offset: 2),
    );
    controller.value = const TextEditingValue(
      text: 'Dum',
      selection: TextSelection.collapsed(offset: 3),
    );

    expect(controller.text, 'Du');
  });

  test('Inserting single replacement after dead key should append replacement',
      () {
    final keyMap = {
      'm': {'m': 'n'}
    };
    final controller = DeadKeysTextEditingController(keyMap: keyMap);
    controller.value = const TextEditingValue(
      text: 'Du',
      selection: TextSelection.collapsed(offset: 2),
    );
    controller.value = const TextEditingValue(
      text: 'Dum',
      selection: TextSelection.collapsed(offset: 3),
    );
    controller.value = const TextEditingValue(
      text: 'Dum',
      selection: TextSelection.collapsed(offset: 3),
    );

    expect(controller.text, 'Dun');
  });

  test(
      'Inserting single character after dead key should append dead key and character',
      () {
    final keyMap = {
      'm': {'o': 'n'}
    };
    final controller = DeadKeysTextEditingController(keyMap: keyMap);
    controller.value = const TextEditingValue(
      text: 'Du',
      selection: TextSelection.collapsed(offset: 2),
    );
    controller.value = const TextEditingValue(
      text: 'Dum',
      selection: TextSelection.collapsed(offset: 3),
    );
    controller.value = const TextEditingValue(
      text: 'Dum',
      selection: TextSelection.collapsed(offset: 3),
    );

    expect(controller.text, 'Dumm');
  });
}
