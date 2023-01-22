// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:career_aid/constant/constant.dart';
import 'package:career_aid/view/shared/shared.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> keywords = [
      'Mobile',
      'Flutter',
      'Dart',
      'System Design',
      'OOP',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi Bella'),
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            'https://picsum.photos/200/300',
          ),
        ).padleft(20),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          //search
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          const Carousel(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YMargin(10),
              Text(
                'Find the right Opportunity for you',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ).padsymmetric(20, 0),
              const YMargin(20),
              SizedBox(
                height: 170.h,
                child: Row(
                  children: [
                    const Expanded(
                      child: StatisticCard(
                        title: 'Jobs/Internships',
                        value: '0.0k',
                        imagePath: 'assets/images/jobsearch.png',
                        color: AppColor.kLightCardColor1,
                      ),
                    ),
                    const XMargin(20),
                    Expanded(
                      child: Column(
                        children: const [
                          Expanded(
                            child: StatisticCard(
                              title: 'Scholarships',
                              value: '0.0k',
                              color: AppColor.kLightCardColor2,
                            ),
                          ),
                          YMargin(20),
                          Expanded(
                            child: StatisticCard(
                              title: 'Grants',
                              value: '0.0k',
                              color: AppColor.kLightCardColor3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ).padsymmetric(20, 0),
              const YMargin(20),
              Text(
                'Recent Opportunity list',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ).padsymmetric(20, 0),
              const YMargin(20),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                      // height: 160.h,
                      padding: REdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22.sm,
                                    backgroundImage: const NetworkImage(
                                      'https://picsum.photos/200/300',
                                    ),
                                  ),
                                  const XMargin(10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Software Engineer',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Google',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                color: AppColor
                                                    .kLightSecondaryTextColor,
                                              ),
                                          children: [
                                            //vode for bullet
                                            TextSpan(
                                              text: ' \u2022 Lagos, Nigeria',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                    color: AppColor
                                                        .kLightSecondaryTextColor,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SvgPicture.asset(
                                'assets/svgs/save.svg',
                                color: AppColor.kLightPrimaryColor,
                              ),
                            ],
                          ),
                          const YMargin(20),
                          //salary
                          RichText(
                            text: TextSpan(
                              text: '₦200k - ₦300k',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: AppColor.kLightPrimaryColor,
                                  ),
                              children: [
                                //vode for bullet
                                TextSpan(
                                  text: '/Mo',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        color: AppColor.kLightSecondaryTextColor
                                            .withOpacity(0.5),
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Wrap(spacing: 10, children: [
                            ...keywords
                                .map(
                                  ((e) => Chip(
                                        label: Text(e),
                                      )),
                                )
                                .toList(),
                          ])
                        ],
                      )).padonly(left: 20, bottom: 20, right: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final String imagePath;
  final Color color;
  const StatisticCard({
    Key? key,
    required this.title,
    required this.value,
    this.imagePath = '',
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath.isNotEmpty) Image.asset(imagePath).padbottom(10),
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ).padbottom(5),
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  CarouselState createState() => CarouselState();
}

class CarouselState extends State<Carousel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.8,
    );

    // Start the ticker
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < 2) {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      } else {
        _pageController.jumpToPage(0);
        // timer.cancel();
      }
    });
  }

  List slides = [
    const InfoCard(
      imageUrl: 'https://picsum.photos/200/400',
      topic: 'Outreachy is current;y out',
      description:
          'Outreachy expressly invites women (both cis and trans), trans men, and genderqueer people to apply. We also expressly invite applications from residents and nationals of the United States of any gender who are Black/African American, Hispanic/Latinx, Native American/American Indian, Alaska Native, Native Hawaiian, or Pacific Islander.',
    ),
    const InfoCard(
      imageUrl: 'https://picsum.photos/300/300',
      topic: 'Outreachy is current;y out',
      description:
          'Outreachy expressly invites women (both cis and trans), trans men, and genderqueer people to apply. We also expressly invite applications from residents and nationals of the United States of any gender who are Black/African American, Hispanic/Latinx, Native American/American Indian, Alaska Native, Native Hawaiian, or Pacific Islander.',
    ),
    const InfoCard(
      imageUrl: 'https://picsum.photos/400/400',
      topic: 'Outreachy is current;y out',
      description:
          'Outreachy expressly invites women (both cis and trans), trans men, and genderqueer people to apply. We also expressly invite applications from residents and nationals of the United States of any gender who are Black/African American, Hispanic/Latinx, Native American/American Indian, Alaska Native, Native Hawaiian, or Pacific Islander.',
    ),
    const InfoCard(
      imageUrl: 'https://picsum.photos/200/400',
      topic: 'Outreachy is current;y out',
      description:
          'Outreachy expressly invites women (both cis and trans), trans men, and genderqueer people to apply. We also expressly invite applications from residents and nationals of the United States of any gender who are Black/African American, Hispanic/Latinx, Native American/American Indian, Alaska Native, Native Hawaiian, or Pacific Islander.',
    ),
    const InfoCard(
      imageUrl: 'https://picsum.photos/500/500',
      topic: 'Outreachy is current;y out',
      description:
          'Outreachy expressly invites women (both cis and trans), trans men, and genderqueer people to apply. We also expressly invite applications from residents and nationals of the United States of any gender who are Black/African American, Hispanic/Latinx, Native American/American Indian, Alaska Native, Native Hawaiian, or Pacific Islander.',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: slides.length,
            itemBuilder: (BuildContext context, int index) {
              return Transform.scale(
                scale: _currentPage == index ? 1 : 0.85,
                child: slides[index],
              );
            },
          ),
        ),
        const YMargin(10),
        SmoothPageIndicator(
          controller: _pageController,
          count: slides.length,
          effect: const JumpingDotEffect(
            jumpScale: 2.0,
            dotColor: AppColor.kLightSecondaryColor,
            activeDotColor: AppColor.kLightPrimaryColor,
            dotHeight: 8,
            dotWidth: 8,
            spacing: 8,
          ),
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final String imageUrl;
  final String topic;
  final String description;

  const InfoCard({
    Key? key,
    required this.imageUrl,
    required this.topic,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  topic,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description.truncateCharacters(100),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
