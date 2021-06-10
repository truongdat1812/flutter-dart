import 'package:flutter/material.dart';

class RoundRectButton extends StatelessWidget {
  const RoundRectButton({
    Key? key,
    required this.text,
    required this.press,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  final String text;
  final Function() press;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.8,
        height: 40,
        child: TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(textColor),
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black12)))),
          onPressed: press,
          child: Text('$text'),
          autofocus: false,
          clipBehavior: Clip.none,
        ));
  }
}
