import 'package:career_aid/view/legal/widget/text_terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms and Conditions"),
      ),
      body: RPadding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: ListView(
          children: const <Widget>[
            TextTerms(
                title: "Collection and Use of Personal Information",
                text:
                    "By using the app, you agree to the collection and use of your personal information in accordance with this privacy policy. We may collect your email and phone number for the purpose of providing you with updates and information about the app, and for sending you notifications about job and scholarship opportunities that match your preferences."),
            TextTerms(
                title: "Security of Personal Information",
                text:
                    "We take the security of your personal information very seriously and have implemented appropriate measures to protect it. We use secure servers and encryption to protect your personal information, and we will not share your information with any third parties without your consent."),
            TextTerms(
                title: "Changes to this Privacy Policy",
                text:
                    "We may make changes to this privacy policy from time to time. If we make any changes, we will update this page and indicate the date of the latest revision. By continuing to use the app, you agree to be bound by the terms of this privacy policy."),
          ],
        ),
      ),
    );
  }
}
