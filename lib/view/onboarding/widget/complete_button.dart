import 'package:career_aid/constant/constant.dart';
import 'package:career_aid/controller/onbaording/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompleteButton extends ConsumerWidget {
  const CompleteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onBoardingProvider = ref.watch(onboardingController);
    return InkWell(
      onTap: (() {
        onBoardingProvider.setHasSeenOnboarding(context);
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        height: 45,
        decoration: BoxDecoration(
          color: AppColor.kLightAccentColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            'Get Started',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
