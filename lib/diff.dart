import 'dart:math';

class Diff {
  final int start;
  final String deleted;
  final String inserted;

  Diff(this.start, this.deleted, this.inserted);
}

Diff getDiff(String oldText, String newText, int position) {
  var end = oldText.length;
  final delta = newText.length - end;
  for (final limit = max(0, position - delta);
      end > limit && oldText[end - 1] == newText[end + delta - 1];
      end--) {}
  var start = 0;
  for (final startLimit = position - max(0, delta);
      start < startLimit && oldText[start] == newText[start];
      start++) {}
  final deleted = (start >= end) ? '' : oldText.substring(start, end);
  final inserted = newText.substring(start, end + delta);
  return Diff(start, deleted, inserted);
}
