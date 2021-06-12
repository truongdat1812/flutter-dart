import 'package:flutter/material.dart';
import 'package:signin_regis/constants.dart';
import 'text_field_container.dart';

class RoundedTextInput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onchanged;
  final String? error;
  const RoundedTextInput({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onchanged,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onchanged,
        decoration: InputDecoration(
            hintText: '$hintText',
            border: InputBorder.none,
            errorText: error,
            icon: Icon(
              icon,
              color: kPrimaryColor,
            )),
      ),
    );
  }
}
