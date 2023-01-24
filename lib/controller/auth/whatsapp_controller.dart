import 'package:career_aid/view/auth/signup/sign_up.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

class WhatsappController with ChangeNotifier {
  //check if user has seen onboarding page
  void setHasSeenOnboarding(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUp(),
      ),
    );

    notifyListeners();
  }
}

// final onboardingController =
//     ChangeNotifierProvider.autoDispose<OnBoardingController>((ref) {
//   return OnBoardingController();
// });
