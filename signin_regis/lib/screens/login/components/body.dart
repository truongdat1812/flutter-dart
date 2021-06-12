import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signin_regis/blocs/signin_bloc.dart';
import 'package:signin_regis/components/round_button.dart';
import 'package:signin_regis/components/round_password_input.dart';
import 'package:signin_regis/components/rounded_text_input.dart';
import 'package:signin_regis/constants.dart';
import 'package:signin_regis/screens/login/components/already_have_account.dart';
import 'package:signin_regis/screens/signup/signup_screen.dart';
import 'background.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  LoginBloc bloc = LoginBloc();
  String? userName;
  String? password;

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
            StreamBuilder(
              stream: bloc.userStream,
              builder: (context, snapshot) => RoundedTextInput(
                hintText: 'Your Email',
                icon: Icons.person,
                onchanged: (value) {
                  userName = value;
                },
                error: snapshot.hasError ? snapshot.error as String : null,
              ),
            ),
            StreamBuilder(
              stream: bloc.passwordStream,
              builder: (context, snapshot) => RoundedPasswordInput(
                hintText: 'Password',
                icon: Icons.lock,
                suffixIcon: Icons.visibility,
                onchanged: (value) {
                  password = value;
                },
                error: snapshot.hasError ? snapshot.error as String : null,
              ),
            ),
            RoundRectButton(
                text: "LOGIN",
                press: () {
                  _loginPress();
                },
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

  void _loginPress() {
    if (bloc.isValidInfo(userName, password)) {
      print("Valid user go to homescreen");
    } else {
      print("InValid user show error on textbox using stream");
    }
  }
}
