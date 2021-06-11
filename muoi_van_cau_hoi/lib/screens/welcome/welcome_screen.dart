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
              WelcomePageView(
                textTitle: 'Mười Vạn Câu Hỏi Vè Sao?',
                textContent:
                    'Tập hợp kiến thức xung quanh ta với nhiều điều thú vị',
                icon: 'assets/icons/flower.svg',
              ),
              WelcomePageView(
                textTitle: 'Truyện Cổ Tích',
                textContent:
                    'Những câu chuyện gắng liền với lối sống người dân Việt Nam và những cuộc phiêu lưu kỳ thú trên thế giới',
                icon: 'assets/icons/signup.svg',
              ),
              WelcomePageView(
                textTitle: 'Flappy Bomb',
                textContent: 'Giúp bạn vừa giải trí vừa học từ mới tiếng Anh',
                icon: 'assets/icons/flower.svg',
              ),
              WelcomePageView(
                textTitle: 'Kiểm Tra Kiến Thúc',
                textContent: 'Đánh giá kiến thức bạn đã tìm hiểu được',
                icon: 'assets/icons/flower.svg',
              ),
            ],
          ),
        ),
        BarBottom(pageController: _pageController),
      ]),
    );
  }
}
