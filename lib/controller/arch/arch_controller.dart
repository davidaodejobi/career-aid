import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArchController with ChangeNotifier {
  //create logic for bottom navigation bar
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

final archController =
    ChangeNotifierProvider.autoDispose<ArchController>((ref) {
  return ArchController();
});
