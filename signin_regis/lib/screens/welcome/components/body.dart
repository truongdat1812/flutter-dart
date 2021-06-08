import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signin_regis/screens/signup/signup_screen.dart';
import '../../login/login_screen.dart';
import '../../../components/round_button.dart';
import 'package:signin_regis/constants.dart';
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
              "assets/icons/chat.svg",
              height: size.height * 0.4,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundRectButton(
              text: "LOGIN",
              backgroundColor: kPrimaryColor,
              textColor: Colors.white,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            RoundRectButton(
              text: "SIGNUP",
              backgroundColor: kPrimaryLightColor,
              textColor: Colors.blue,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
