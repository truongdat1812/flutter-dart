import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signin_regis/blocs/signin_bloc.dart';
import 'package:signin_regis/components/circle_social_icon.dart';
import 'package:signin_regis/components/round_button.dart';
import 'package:signin_regis/components/round_password_input.dart';
import 'package:signin_regis/components/rounded_text_input.dart';
import 'package:signin_regis/constants.dart';
import 'package:signin_regis/screens/home/home_screen.dart';
import 'package:signin_regis/screens/login/components/already_have_account.dart';
import 'package:signin_regis/screens/login/login_screen.dart';
import './background.dart';
import './or_divider.dart';

class Body extends StatelessWidget {
  LoginBloc bloc = LoginBloc();
  _signUp(BuildContext context) {
    print("create user success!");
    bloc.signUp(
        "dat.truong.playsoft@gmail.com", "pass123456", '090765234', "Dat", () {
      print("create user success =>  Navigator to !");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGNUP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                width: size.width * 0.6,
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
                  onchanged: (value) {},
                  suffixIcon: Icons.visibility),
              RoundRectButton(
                  text: 'SIGN UP',
                  press: () {
                    _signUp(context);
                  },
                  backgroundColor: kPrimaryColor,
                  textColor: Colors.white),
              SizedBox(
                height: size.height * 0.03,
              ),
              AlreadyHaveAccountCheck(
                  login: false,
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
              SizedBox(
                height: size.height * 0.03,
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleSociaIIcon(
                    icon: 'assets/icons/facebook.svg',
                    press: () {},
                  ),
                  CircleSociaIIcon(
                    icon: 'assets/icons/google-plus.svg',
                    press: () {},
                  ),
                  CircleSociaIIcon(
                    icon: 'assets/icons/twitter.svg',
                    press: () {},
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
