import 'package:career_aid/constant/app_color.dart';
import 'package:career_aid/controller/onbaording/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SkipButton extends ConsumerWidget {
  const SkipButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onBoardingProvider = ref.watch(onboardingController);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.kLightSecondaryColor.withAlpha(100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        onBoardingProvider.setHasSeenOnboarding(context);
      },
      child: Text(
        'Skip',
        style: Theme.of(context).textTheme.headline5!.copyWith(
              color: Colors.black,
            ),
      ),
    );
  }
}
