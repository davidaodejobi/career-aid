// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:career_aid/constant/constant.dart';
import 'package:career_aid/view/shared/shared.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const YMargin(50),
              Text(
                'Create an Account',
                style: Theme.of(context).textTheme.headline3,
              ).padleft(20),
              const YMargin(20),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: AppColor.kLighTrimaryTextColor,
                    ),
              ).padleft(20),
              const YMargin(50),
              TextFieldWithHeader(
                title: 'Full name',
                controller: TextEditingController(),
                keyboardType: TextInputType.name,
              ),
              const YMargin(20),
              TextFieldWithHeader(
                title: 'Email',
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
              ),
              const YMargin(20),
              TextFieldWithHeader(
                title: 'WhatsApp number',
                controller: TextEditingController(),
                keyboardType: TextInputType.number,
              ),
              const YMargin(20),
              PassTextFieldWithHeader(
                hideAction: () {},
                obscureText: true,
                title: 'Password',
                controller: TextEditingController(),
                keyboardType: TextInputType.visiblePassword,
              ),
              const YMargin(30),
              AppElevatedButton(
                onPressed: () {},
                title: 'sign up',
              ),
              AuthBottomButton(
                onPressed: () {},
                normalText: 'Already have an account?',
                buttonText: 'Sign in',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
