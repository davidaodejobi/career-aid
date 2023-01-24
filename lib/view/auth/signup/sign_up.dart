// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:career_aid/controller/auth/sign_up_controller.dart';
import 'package:career_aid/service/service.dart';
import 'package:career_aid/view/auth/signin/sign_in.dart';
import 'package:flutter/material.dart';

import 'package:career_aid/constant/constant.dart';
import 'package:career_aid/view/shared/shared.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

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

final controller = GetIt.I.get<SignupController>();
final hiveDB = GetIt.I.get<HiveStorageService>();

class TextfieldsWithButton extends StatefulWidget {
  const TextfieldsWithButton({
    Key? key,
  }) : super(key: key);

  @override
  State<TextfieldsWithButton> createState() => _TextfieldsWithButtonState();
}

class _TextfieldsWithButtonState extends State<TextfieldsWithButton> {
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFieldWithHeader(
            title: 'Full name',
            controller: controller.nameController,
            keyboardType: TextInputType.name,
            validator: (text) => controller.validateName(text),
          ),
          const YMargin(20),
          TextFieldWithHeader(
            title: 'Email',
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (text) => controller.validateEmail(text),
          ),
          const YMargin(20),
          PassTextFieldWithHeader(
            hideAction: () {},
            obscureText: true,
            title: 'Password',
            controller: controller.passwordController,
            keyboardType: TextInputType.visiblePassword,
            validator: (text) => controller.validatePassword(text),
          ),
          const YMargin(20),
          PassTextFieldWithHeader(
            hideAction: () {},
            obscureText: true,
            title: 'Confirm Password',
            controller: controller.confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            validator: (text) => controller.validateConfirmPassword(
              controller.passwordController.text,
              controller.confirmPasswordController.text,
            ),
          ),
          const YMargin(30),
          const Button(),
          AuthBottomButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignIn(),
                ),
              );
            },
            normalText: 'Already have an account?',
            buttonText: 'Sign in',
          ),
        ],
      ),
    );
  }
}

class Button extends ConsumerWidget {
  const Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupProvider = ref.watch(signupController);
    return AppElevatedButton(
      isLoading: signupProvider.isLoading,
      isCompleted: signupProvider.isSigningIn,
      onPressed: () {
        if (controller.validateAndSubmit()) {
          hiveDB.storeItem(key: name, value: controller.nameController.text);
          signupProvider.submit(context);
        }
      },
      title: 'sign up',
    );
  }
}
