import 'package:career_aid/constant/constant.dart';
import 'package:flutter/material.dart';

class TextFieldWithHeader extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;

  const TextFieldWithHeader({
    super.key,
    required this.title,
    required this.controller,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ).padleft(20),
        const SizedBox(height: 10.0),
        TextFormField(
          //change curor color
          controller: controller,

          // validator: validator,
          cursorColor: AppColor.kLightPrimaryColor,
          style: Theme.of(context).textTheme.bodyText1,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.kLightSecondaryColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
        ).addShadowToTextField,
      ],
    );
  }
}

class PassTextFieldWithHeader extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final VoidCallback hideAction;

  const PassTextFieldWithHeader({
    Key? key,
    required this.title,
    required this.controller,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.hideAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ).padleft(20),
        const SizedBox(height: 10.0),
        TextFormField(
          controller: controller,
          cursorColor: AppColor.kLightPrimaryColor,
          style: Theme.of(context).textTheme.bodyText1,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: obscureText
                  ? Icon(
                      Icons.visibility,
                      color: Colors.grey.shade400,
                    )
                  : Icon(
                      Icons.visibility_off,
                      color: Colors.grey.shade400,
                    ),
              onPressed: hideAction,
            ),
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.kLightSecondaryColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
        ).addShadowToTextField,
      ],
    );
  }
}
