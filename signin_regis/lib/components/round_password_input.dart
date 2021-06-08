import 'package:flutter/material.dart';
import 'package:signin_regis/constants.dart';
import 'text_field_container.dart';

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onchanged,
    required this.suffixIcon,
  }) : super(key: key);

  final String hintText;
  final IconData icon, suffixIcon;
  final ValueChanged<String> onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      onChanged: onchanged,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '$hintText',
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            suffixIcon,
            color: kPrimaryColor,
          )),
    ));
  }
}
