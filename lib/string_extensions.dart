extension StringExtensions on String {
  String insert(String text, int position) {
    return substring(0, position) + text + substring(position);
  }
}
