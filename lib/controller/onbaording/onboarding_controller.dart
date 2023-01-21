import 'package:career_aid/locator.dart';
import 'package:career_aid/service/service.dart';
import 'package:career_aid/view/auth/signup/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constant/constant.dart';

class OnBoardingController with ChangeNotifier {
  //check if user has seen onboarding page
  final HiveStorageService _storageService = getIt<HiveStorageService>();
  bool _hasSeenOnboarding = false;
  bool get hasSeenOnboarding => _hasSeenOnboarding;

  void setHasSeenOnboarding(BuildContext context) {
    _hasSeenOnboarding = true;
    _storageService.storeItem(key: onBoarded, value: _hasSeenOnboarding);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUp(),
      ),
    );

    notifyListeners();
  }
}

final onboardingController =
    ChangeNotifierProvider.autoDispose<OnBoardingController>((ref) {
  return OnBoardingController();
});
