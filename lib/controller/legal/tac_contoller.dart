import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TacController extends ChangeNotifier {
  bool _termsAccepted = false;

  bool get termsAccepted => _termsAccepted;

  void toggleTermsAccepted() {
    _termsAccepted = !_termsAccepted;
    notifyListeners();
  }

  void handleLogin() {
    if (_termsAccepted) {
      // Perform login actions
    } else {
      // Show error message for not accepting terms and conditions
    }
  }
}

final termsController =
    ChangeNotifierProvider.autoDispose<TacController>((ref) {
  return TacController();
});
