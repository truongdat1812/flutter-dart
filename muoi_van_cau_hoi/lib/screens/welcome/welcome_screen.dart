import 'package:flutter/material.dart';
import 'package:muoi_van_cau_hoi/screens/welcome/components/bar_bottom.dart';

import 'components/welcome_page_view.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(),
      body: Column(children: <Widget>[
        Container(
          height: size.height * 0.9,
          child: PageView(
            controller: _pageController,
            pageSnapping: true,
            children: <Widget>[
              WelcomePageView(),
              Container(
                color: Colors.green,
                child: GestureDetector(
                  onTap: () {},
                ),
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.yellow,
              ),
            ],
          ),
        ),
        BarBottom(pageController: _pageController),
      ]),
    );
  }
}

// _pageController.animateToPage(1,
//     duration: Duration(milliseconds: 500),
//     curve: Curves.bounceInOut);
