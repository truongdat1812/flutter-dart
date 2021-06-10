import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import './background.dart';

class WelcomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome To EDU".toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/flower.svg",
              height: size.height * 0.4,
            ),
          ],
        ),
      ),
    );
  }
}
