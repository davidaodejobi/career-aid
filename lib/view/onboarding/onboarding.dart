// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:career_aid/constant/constant.dart';
import 'package:career_aid/view/onboarding/widget/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widget/onboarding_page.dart';

class Onboarding extends StatelessWidget {
  Onboarding({Key? key}) : super(key: key);
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              children: [
                OnboardingPage(
                  size: size,
                  imageUrl: 'assets/images/splash.png',
                  title: 'Welcome to CareerAid',
                  description:
                      'CareerAid is a platform that helps you to manage your business and make it grow faster and better than ever',
                  page: OnboardPage.one,
                  pageController: pageController,
                ),
                OnboardingPage(
                  size: size,
                  imageUrl: 'assets/images/splash.png',
                  title: 'Welcome to CareerAid',
                  description:
                      'CareerAid is a platform that helps you to manage your business and make it grow faster and better than ever',
                  page: OnboardPage.two,
                  pageController: pageController,
                ),
                OnboardingPage(
                  size: size,
                  imageUrl: 'assets/images/splash.png',
                  title: 'Welcome to CareerAid',
                  description:
                      'CareerAid is a platform that helps you to manage your business and make it grow faster and better than ever',
                  page: OnboardPage.three,
                  pageController: pageController,
                ),
              ],
            ),
            Positioned(
              bottom: 16,
              left: 16,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const JumpingDotEffect(
                  jumpScale: 2.0,
                  dotColor: Colors.white,
                  activeDotColor: AppColor.kLightAccentColor,
                  dotHeight: 12,
                  dotWidth: 12,
                  spacing: 8,
                ),
              ),
            ),
            const Positioned(
              top: 10,
              right: 16,
              child: SkipButton(),
            )
          ],
        ),
      ),
    );
  }
}
