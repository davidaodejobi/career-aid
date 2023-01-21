import 'package:flutter/material.dart';

extension ShadowExtension on Widget {
  Widget get addShadowToTextField {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2)..alpha,
            spreadRadius: 20,
            blurRadius: 30,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: this,
    );
  }
}
