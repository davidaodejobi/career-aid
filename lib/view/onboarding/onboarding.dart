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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              children: [
                OnboardingPage(
                  size: size,
                  imageUrl: 'assets/images/onboard1.png',
                  title: 'Welcome to CareerAid',
                  description:
                      'CareerAid makes your job, grant and scholarship search easy and efficient. Say goodbye to the stress and hassle of job, grants and scholarship hunting, CareerAid is here to help.',
                  page: OnboardPage.one,
                  pageController: pageController,
                ),
                OnboardingPage(
                  size: size,
                  imageUrl: 'assets/images/onboard2.png',
                  title: 'Get Ahead with CareerAid',
                  description:
                      'Our user-friendly platform and WhatsApp integration will help you land your dream job or scholarship with ease. Create your profile, find matching opportunities, get tips and resources to prepare for interviews.',
                  page: OnboardPage.two,
                  pageController: pageController,
                ),
                OnboardingPage(
                  size: size,
                  imageUrl: 'assets/images/onboard3.png',
                  title: 'Give back to the community',
                  description:
                      'Our platform not only allows you to find volunteer opportunities and connect with local non-profit organizations, but also gives you the opportunity to share your experience and advice with others seeking jobs, grants, and scholarships.',
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
                  dotHeight: 8,
                  dotWidth: 8,
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
