//extention to capitalize the first letter of the string
extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String capitalize() {
    return toUpperCase();
  }
}
