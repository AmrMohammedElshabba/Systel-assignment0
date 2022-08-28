import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType keybordType;
  String hitText;
  String? Function(String?)? validator;
  void Function(String?)? onchange;
  void Function()? onTap;
  bool obsecureText;

  CustomTextFormField({
    Key? key,
    required this.controller,
    required this.keybordType,
    required this.hitText,
    this.validator,
    this.obsecureText = false,
    this.onTap,
    this.onchange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.headline4,
      cursorColor: AppColors.gray,
      keyboardType: keybordType,
      obscureText: obsecureText,
      validator: validator,
      controller: controller,
      onChanged: onchange,
      onTap: onTap,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        fillColor: Theme.of(context).canvasColor,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        errorStyle: TextStyle(color: Theme.of(context).errorColor),
        hintText: hitText,
        hintStyle: Theme.of(context).textTheme.headline4,
        labelStyle: Theme.of(context).textTheme.headline4,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(color: Theme.of(context).canvasColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(color: Theme.of(context).canvasColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(color: Theme.of(context).errorColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(color: Theme.of(context).canvasColor)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(color: Theme.of(context).canvasColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(color: Theme.of(context).canvasColor)),
      ),
    );
  }
}
