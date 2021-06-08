import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signin_regis/components/round_button.dart';
import 'package:signin_regis/components/round_password_input.dart';
import 'package:signin_regis/components/rounded_text_input.dart';
import 'package:signin_regis/constants.dart';
import 'package:signin_regis/screens/login/components/already_have_account.dart';
import 'package:signin_regis/screens/signup/signup_screen.dart';
import 'background.dart';

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
              "LOGIN".toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedTextInput(
              hintText: 'Your Email',
              icon: Icons.person,
              onchanged: (value) {},
            ),
            RoundedPasswordInput(
              hintText: 'Password',
              icon: Icons.lock,
              suffixIcon: Icons.visibility,
              onchanged: (value) {},
            ),
            RoundRectButton(
                text: "LOGIN",
                press: () {},
                backgroundColor: kPrimaryColor,
                textColor: Colors.white),
            AlreadyHaveAccountCheck(
              login: true,
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
