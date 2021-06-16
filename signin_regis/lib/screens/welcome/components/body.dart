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

class MyProfileWeb extends StatelessWidget {
  const MyProfileWeb({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height,
      child: Column(children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Container(
            color: kPrimaryColor,
            width: size.width,
            height: 100,
            child: Row(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 150),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Trương Khắc Đạt",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        )),
                    Text("Mobile Developer",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: kPrimaryLightColor,
                        )),
                    Text("(Objective-C/Swift/Java/Flutter/React Native)",
                        style: TextStyle(
                          fontSize: 13,
                          color: kPrimaryLightColor,
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Image.asset(
                "assets/images/mobile_profile.png",
                width: 270,
                height: 100,
                fit: BoxFit.fill,
              )
            ])),
        Container(
          padding: EdgeInsets.only(left: 350, top: 50),
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.date_range,
                    color: kPrimaryColor,
                  ),
                  Text(
                    "18/12/1982",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  SizedBox(
                    width: 270,
                  ),
                  Icon(
                    Icons.person,
                    color: kPrimaryColor,
                  ),
                  Text(
                    "Male",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.phone,
                    color: kPrimaryColor,
                  ),
                  Text(
                    "0908417325",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  SizedBox(
                    width: 270,
                  ),
                  Icon(
                    Icons.email,
                    color: kPrimaryColor,
                  ),
                  Text(
                    "truong.dat.tkd@gmail.com",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_city,
                    color: kPrimaryColor,
                  ),
                  Container(
                    width: 250,
                    child: Text(
                      "182/10/4 - Hồ Văn Long Street - Bình Hưng Hoà B - Bình Tân - Hồ Chí Minh City",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Icon(
                    Icons.link,
                    color: kPrimaryColor,
                  ),
                  Text(
                    "https://github.com/truongdat1812",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
