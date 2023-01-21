import 'package:career_aid/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color bgColor;
  final Color fgColor;
  const AppElevatedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.bgColor = AppColor.kLightPrimaryColor,
    this.fgColor = AppColor.kLightChipsBackgroundColor1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.75.sw,
      height: 48.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: fgColor,
          backgroundColor: bgColor, // foreground (text) color
        ),
        onPressed: onPressed,
        child: Text(
          title.capitalize(),
        ),
      ),
    );
  }
}
