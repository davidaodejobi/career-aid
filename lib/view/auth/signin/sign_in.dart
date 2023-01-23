// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:career_aid/view/auth/signup/sign_up.dart';
import 'package:flutter/material.dart';

import 'package:career_aid/constant/constant.dart';
import 'package:career_aid/view/shared/shared.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ModalRoute.of(context)!.canPop
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const YMargin(10),
            Text(
              'Welcome Back',
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              title: 'Email',
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
            ),
            const YMargin(20),
            PassTextFieldWithHeader(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUp(),
                  ),
                );
              },
              normalText: 'Already have an account?',
              buttonText: 'Sign up',
            ),
          ],
        ),
      ),
    );
  }
}
