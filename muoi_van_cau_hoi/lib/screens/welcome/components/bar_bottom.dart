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
      padding: EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Text(
              'Bỏ qua',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
          new DotsIndicator(
            controller: _pageController,
            itemCount: 4,
            onPageSelected: (int page) {
              _pageController.animateToPage(
                page,
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceInOut,
              );
            },
          ),
          GestureDetector(
            onTap: () {
              _pageController.animateToPage(_pageController.page!.toInt() + 1,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.bounceInOut);
            },
            child: Text(
              'Tiếp',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
