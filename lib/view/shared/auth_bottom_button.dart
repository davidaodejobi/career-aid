// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:career_aid/constant/app_color.dart';
import 'package:career_aid/view/shared/margin.dart';

class AuthBottomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String normalText;
  final String buttonText;

  const AuthBottomButton({
    Key? key,
    required this.onPressed,
    required this.normalText,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          normalText,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const XMargin(10),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  decoration: TextDecoration.underline,
                  color: AppColor.kLightAccentColor,
                ),
          ),
        ),
      ],
    );
  }
}
