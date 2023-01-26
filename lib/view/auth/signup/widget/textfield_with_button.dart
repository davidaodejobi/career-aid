import 'package:career_aid/constant/constant.dart';
import 'package:career_aid/controller/auth/auth_controller.dart';
import 'package:career_aid/controller/auth/sign_up_controller.dart';
import 'package:career_aid/service/service.dart';
import 'package:career_aid/view/auth/signin/sign_in.dart';
import 'package:career_aid/view/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final controller = GetIt.I.get<SignupController>();
final authController = GetIt.I.get<AuthController>();
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
  void initState() {
    controller.init();
    super.initState();
  }

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
          // TextFieldWithHeader(
          //   title: 'Full name',
          //   controller: controller.nameController,
          //   keyboardType: TextInputType.name,
          //   validator: (text) => controller.validateName(text),
          // ),
          // const YMargin(20),
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
        print('controller.emailController: ${controller.emailController}');
        if (controller.validateAndSubmit()) {
          hiveDB.storeItem(key: name, value: controller.nameController.text);
          signupProvider.submit(
            context,
            email: controller.emailController.text,
            password: controller.passwordController.text,
          );
        }
      },
      title: 'sign up',
    );
  }
}
