import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signin_regis/constants.dart';

class CircleSociaIIcon extends StatelessWidget {
  final String icon;
  final Function() press;

  const CircleSociaIIcon({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: kPrimaryLightColor),
            shape: BoxShape.circle),
        child: SvgPicture.asset(
          icon,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
