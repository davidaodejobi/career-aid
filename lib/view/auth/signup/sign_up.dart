// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:career_aid/view/auth/signup/widget/textfield_with_button.dart';
import 'package:flutter/material.dart';

import 'package:career_aid/constant/constant.dart';
import 'package:career_aid/view/shared/shared.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
        // other properties
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const YMargin(10),
            Text(
              'Create an Account',
              style: Theme.of(context).textTheme.headline3,
            ).padsymmetric(20, 0),
            const YMargin(20),
            Text(
              'Fill in the details below to create an account',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: AppColor.kLighTrimaryTextColor,
                  ),
            ).padsymmetric(20, 0),
            const YMargin(50),
            const TextfieldsWithButton(),
          ],
        ),
      ),
    );
  }
}
