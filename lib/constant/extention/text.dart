//extention to capitalize the first letter of the string
extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String capitalize() {
    return toUpperCase();
  }

  String truncateWords(int wordCount) {
    final words = split(' ');
    if (words.length <= wordCount) {
      return this;
    }
    return '${words.take(wordCount).join(' ')}...';
  }

  String truncateCharacters(int charCount) {
    if (length <= charCount) {
      return this;
    }
    return '${substring(0, charCount)}...';
  }
}
