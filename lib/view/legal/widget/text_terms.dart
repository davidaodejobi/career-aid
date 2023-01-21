import 'package:flutter/material.dart';

class TextTerms extends StatelessWidget {
  final String title;
  final String text;

  const TextTerms({Key? key, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(text),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
