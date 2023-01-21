import 'package:career_aid/controller/legal/tac_contoller.dart';
import 'package:career_aid/view/legal/term_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TacApproval extends ConsumerWidget {
  const TacApproval({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final termProvider = ref.watch(termsController);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          value: termProvider.termsAccepted,
          onChanged: (newValue) {
            termProvider.toggleTermsAccepted();
          },
        ),
        InkWell(
          child: Text(
            'Agree to terms and conditions',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const TermsAndConditions();
                },
              ),
            );
          },
        )
      ],
    );
  }
}
