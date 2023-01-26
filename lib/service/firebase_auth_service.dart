import 'package:career_aid/view/shared/shared.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signWithEmail({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    print('email: $email');
    print('password: $password');
    print('hereeeeeeeeeeeeeeeeeeeeee');
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Perform additional tasks, such as sending email verification
      // or displaying a success message
    } on FirebaseAuthException catch (e) {
      print('e: $e');
      if (context != null) {
        _handleError(e, context);
      }
    }
  }

  void _handleError(FirebaseAuthException e, BuildContext context) {
    var errorMessage = 'Invalid email address';
    if (e is PlatformException) {
      switch (e.code) {
        case 'ERROR_INVALID_EMAIL':
          errorMessage = 'Invalid email address';
          break;
        case 'ERROR_WRONG_PASSWORD':
          errorMessage = 'Invalid password';
          break;
        case 'ERROR_USER_NOT_FOUND':
          errorMessage = 'User not found';
          break;
        case 'ERROR_USER_DISABLED':
          errorMessage = 'User has been disabled';
          break;
        case 'ERROR_TOO_MANY_REQUESTS':
          errorMessage = 'Too many requests. Try again later';
          break;
        case 'ERROR_OPERATION_NOT_ALLOWED':
          errorMessage = 'Signing in with email and password is not enabled';
          break;
        default:
          errorMessage = 'An undefined Error happened.';
      }
      successToast(context, message: errorMessage);
    }
  }
}
