import 'package:career_aid/constant/constant.dart';
import 'package:career_aid/view/onboarding/widget/complete_button.dart';
import 'package:career_aid/view/shared/shared.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
    required this.size,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.page,
    required this.pageController,
  }) : super(key: key);

  final Size size;
  final String imageUrl;
  final String title;
  final String description;
  final OnboardPage page;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: size.height * 0.6,
              width: size.width,
            ),
            Positioned(
              bottom: -50,
              child: Container(
                height: size.height * 0.6,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.kLighTrimaryTextColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(page == OnboardPage.one ? 40 : 0),
                topRight: Radius.circular(page == OnboardPage.three ? 40 : 0),
              ),
            ),
            // height: double.infinity,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 16,
                right: 16,
                bottom: 20,
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            title,
                            style:
                                Theme.of(context).textTheme.headline3!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          const YMargin(20),
                          Text(
                            description,
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: page == OnboardPage.three
                        ? const CompleteButton()
                        : InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              pageController.animateToPage(
                                2,
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.easeIn,
                              );
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: AppColor.kLightAccentColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
