import 'package:career_aid/service/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController with ChangeNotifier {
  final FirebaseAuthService _authService = FirebaseAuthService();

  Future<void> signWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    await _authService.signWithEmail(
      email: email,
      password: password,
      context: context,
    );
    notifyListeners();
  }
}

final authController =
    ChangeNotifierProvider.autoDispose<AuthController>((ref) {
  return AuthController();
});
