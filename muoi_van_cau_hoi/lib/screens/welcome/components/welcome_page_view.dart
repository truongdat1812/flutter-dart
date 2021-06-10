import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muoi_van_cau_hoi/constants.dart';
import './background.dart';

class WelcomePageView extends StatelessWidget {
  final String textTitle;
  final String textContent;
  final String icon;
  WelcomePageView({
    required this.textTitle,
    required this.textContent,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              icon,
              height: size.height * 0.1,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              '$textTitle',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              '$textContent',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
