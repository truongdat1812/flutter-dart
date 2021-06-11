import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muoi_van_cau_hoi/components/round_button.dart';
import 'package:muoi_van_cau_hoi/constants.dart';
import 'package:muoi_van_cau_hoi/screens/home/home_screen.dart';
import 'package:muoi_van_cau_hoi/screens/knowledge_test/quiz_screen.dart';
import './background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.4,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundRectButton(
              text: "Bắt đầu",
              backgroundColor: kPrimaryColor,
              textColor: Colors.white,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuizScreen()));
              },
            ),
            RoundRectButton(
              text: "Điểm số",
              backgroundColor: kPrimaryLightColor,
              textColor: Colors.blue,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            RoundRectButton(
              text: "Cài Đặt",
              backgroundColor: kPrimaryLightColor,
              textColor: Colors.blue,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
