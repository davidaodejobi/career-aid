import 'package:career_aid/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: ((context) => const Home()),
        ),
        (route) => false,
      );
    },
  );
}
