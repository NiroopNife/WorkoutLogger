import 'package:flutter/material.dart';

import '../../utils/color_manager.dart';

class InputTextField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final TextEditingController controller;

  const InputTextField({Key? key, required this.labelText, required this.prefixIcon, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          labelText: labelText),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final TextEditingController controller;

  const PasswordTextField(
      {Key? key,
      required this.labelText,
      required this.prefixIcon,
      required this.controller,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          labelText: labelText,),
    );
  }
}
