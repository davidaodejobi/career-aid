import 'package:flutter/material.dart';

import '../../../../main.dart';

skipWhatsAppVerification(BuildContext context) {
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
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: ((context) => const Home()),
                ),
                (route) => false,
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
