import 'package:flutter/material.dart';
import 'package:muoi_van_cau_hoi/constants.dart';
import 'package:muoi_van_cau_hoi/screens/welcome/components/dot_indicator.dart';

class BarBottom extends StatelessWidget {
  const BarBottom({
    Key? key,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.07,
      color: kPrimaryColor,
      child: Center(
          child: new DotsIndicator(
        controller: _pageController,
        itemCount: 4,
        onPageSelected: (int page) {
          _pageController.animateToPage(
            page,
            duration: Duration(milliseconds: 500),
            curve: Curves.bounceInOut,
          );
        },
      )),
    );
  }
}
