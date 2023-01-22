import 'dart:async';

import 'package:career_aid/constant/constant.dart';
import 'package:career_aid/view/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
      body: ListView(
        children: const [
          MyHomePage(),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
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
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Transform.scale(
                scale: _currentPage == index ? 1 : 0.85,
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://picsum.photos/200/300',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            },
          ),
        ),
        const YMargin(10),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
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
