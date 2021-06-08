import 'package:flutter/material.dart';
import 'package:signin_regis/constants.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Divider(
            height: 1.5,
            color: kPrimaryColor,
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
              child: Divider(
            height: 1.5,
            color: kPrimaryColor,
          )),
        ],
      ),
    );
  }
}
