// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

import 'package:career_aid/constant/constant.dart';

class AppElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color bgColor;
  final Color fgColor;
  final bool isLoading;
  final bool isCompleted;
  const AppElevatedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.bgColor = AppColor.kLightPrimaryColor,
    this.fgColor = AppColor.kLightChipsBackgroundColor1,
    this.isLoading = false,
    this.isCompleted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 0.75.sw,
          height: 48.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: fgColor,
              backgroundColor: bgColor, // foreground (text) color
            ),
            onPressed: onPressed,
            child: isLoading
                ? const SpinKitChasingDots(
                    color: Colors.white,
                    size: 40,
                  )
                : Text(
                    title.capitalize(),
                  ),
          ),
        ),
        if (isCompleted)
          Positioned(
            right: 0,
            top: 0,
            child: Lottie.asset(
              'assets/animations/complete.json',
              width: 50.w,
              height: 50.h,
              repeat: false,
            ),
          ),
      ],
    );
  }
}
