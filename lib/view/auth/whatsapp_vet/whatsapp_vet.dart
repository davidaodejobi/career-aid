// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:career_aid/controller/legal/tac_contoller.dart';
import 'package:career_aid/service/base_api.dart';
import 'package:career_aid/view/arch/arch.dart';
import 'package:career_aid/view/auth/whatsapp_vet/widget/skip_whatsapp_verification.dart';
import 'package:career_aid/view/legal/widget/tac_approval.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:career_aid/constant/constant.dart';
import 'package:career_aid/view/shared/shared.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your WhatsApp number';
                }
                return null;
              },
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
                      // successDialog(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InterestScreen(),
                        ),
                      );
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
                      skipWhatsAppVerification(context);
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

final List<String> types = [
  "Job: IT",
  "Job: Marketing",
  "Job: Finance",
  "Scholarship: Masters",
  "Scholarship: Undergraduate",
  "Scholarship: Secondary",
  "Grant: Small Business",
  "Grant: Non-Profit",
];

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  InterestScreenState createState() => InterestScreenState();
}

class InterestScreenState extends State<InterestScreen> {
  final List<String> _selectedTypes = [];

  sendMessage() async {
    Response response =
        await connectBaseApi().post('/whatsapp/message/send', data: {
      'sender': '2348035221842',
      'template_code': '4db33e88-4128-468f-9507-7ca0a86313c6',
      'type': 'template',
      'recipient': '2349075795632'
    });
    Logger().i(response.statusCode);
    Logger().i(response.statusMessage);
    Logger().i(response.data);
    if (response.statusCode == 200) {
      Logger().d(response.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Interests"),
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            spacing: 10.0.w,
            children: types.map((interest) {
              return ChoiceChip(
                selectedColor: AppColor.kLightSecondaryColor,
                label: Text(interest),
                selected: _selectedTypes.contains(interest),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedTypes.add(interest);
                    } else {
                      _selectedTypes.remove(interest);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const YMargin(20),
          AppElevatedButton(
            title: 'Get Started',
            onPressed: () {
              // sendMessage();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Arch(),
                ),
              );
            },
          )
        ],
      ).padsymmetric(20, 0),
    );
  }
}
