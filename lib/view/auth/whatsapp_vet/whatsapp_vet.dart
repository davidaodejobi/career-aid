// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:career_aid/controller/legal/tac_contoller.dart';
import 'package:career_aid/main.dart';
import 'package:career_aid/view/legal/widget/tac_approval.dart';
import 'package:flutter/material.dart';

import 'package:career_aid/constant/constant.dart';
import 'package:career_aid/view/shared/shared.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class WhatsAppVet extends ConsumerWidget {
  const WhatsAppVet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final termProvider = ref.watch(termsController);
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
              'Let\'s verify your WhatsApp number',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ).padleft(20),
            const YMargin(20),
            TextFieldWithHeader(
              title: 'WhatsApp number',
              controller: TextEditingController(),
              keyboardType: TextInputType.number,
            ),
            const YMargin(40),
            AppElevatedButton(
              bgColor: !termProvider.termsAccepted
                  ? Colors.grey.shade300
                  : AppColor.kLightPrimaryColor,
              fgColor: !termProvider.termsAccepted
                  ? AppColor.kLightPrimaryColor.withOpacity(0.3)
                  : AppColor.kLightBackgroundColor,
              onPressed: !termProvider.termsAccepted
                  ? () {}
                  : () {
                      successDialog(context);
                    },
              title: 'Verify',
            ),
            const YMargin(16),
            AppElevatedButton(
              bgColor: !termProvider.termsAccepted
                  ? Colors.grey.shade300
                  : AppColor.kLightSecondaryColor,
              fgColor: !termProvider.termsAccepted
                  ? AppColor.kLightPrimaryColor.withOpacity(0.3)
                  : AppColor.kLightPrimaryColor,
              onPressed: !termProvider.termsAccepted
                  ? () {}
                  : () {
                      skipWhatsAppVetting(context);
                    },
              title: 'Skip',
            ),
            const TacApproval(),
          ],
        ),
      ),
    );
  }
}

skipWhatsAppVetting(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Skip WhatsApp Vetting"),
        content: const Text(
            "Are you sure you want to skip the process of adding your number for sending updates? You will not receive updates on your application status"),
        actions: <Widget>[
          TextButton(
            child: const Text("Yes"),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ((context) => const Home()),
                ),
              );
            },
          ),
          ElevatedButton(
            child: const Text("No"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

successDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Successful",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
        content: Lottie.asset('assets/animations/success.json'),
      );
    },
  );

  // Wait for 3 seconds
  Future.delayed(const Duration(seconds: 3)).then(
    (_) {
      // Close the dialog
      Navigator.of(context).pop();

      // Navigate to the new screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const Home()),
        ),
      );
    },
  );
}
