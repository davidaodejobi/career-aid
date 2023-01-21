// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:career_aid/controller/legal/tac_contoller.dart';
import 'package:career_aid/view/legal/widget/tac_approval.dart';
import 'package:flutter/material.dart';

import 'package:career_aid/constant/constant.dart';
import 'package:career_aid/view/shared/shared.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              onPressed: !termProvider.termsAccepted ? () {} : () {},
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
              onPressed: !termProvider.termsAccepted ? () {} : () {},
              title: 'Skip',
            ),
            const TacApproval(),
          ],
        ),
      ),
    );
  }
}
