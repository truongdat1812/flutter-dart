import 'package:flutter/material.dart';
import 'package:muoi_van_cau_hoi/constants.dart';
import 'package:muoi_van_cau_hoi/screens/fairy_tale/fairy_tale_home.dart';
import 'package:muoi_van_cau_hoi/screens/home/components/home_card.dart';
import 'package:muoi_van_cau_hoi/screens/knowledge_test/knowledge_test_home.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(
          height: size.height,
          child: Row(
            children: <Widget>[
              LeftSide(),
              RightSide(),
            ],
          ),
        )
      ],
    );
  }
}

class LeftSide extends StatelessWidget {
  const LeftSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.red,
      height: size.height,
      width: size.width * 0.5,
      child: Column(
        children: <Widget>[
          HomeItemCard(
            width: size.width * 0.5,
            iconSize: 100,
            height: size.height * 0.375,
            color: kHomeLeftItemColor1,
            title: 'Kiểm tra kiến thức',
            iconName: 'assets/icons/signup.svg',
            onPress: () {
              print("On first press");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => KnowledgeTestHome()));
            },
          ),
          HomeItemCard(
            width: size.width * 0.5,
            iconSize: 100,
            height: size.height * 0.25,
            color: kHomeLeftItemColor2,
            title: 'Cổ tích Việt Nam',
            iconName: 'assets/icons/flower.svg',
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FairyTaleHome()));
              print("On second press");
            },
          ),
          HomeItemCard(
            width: size.width * 0.5,
            iconSize: 100,
            height: size.height * 0.25,
            color: kHomeLeftItemColor3,
            title: 'Cổ tích thế giới',
            iconName: 'assets/icons/sun.svg',
            onPress: () {
              print("On third press");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FairyTaleHome()));
            },
          ),
          Row(
            children: <Widget>[
              HomeItemCard(
                width: size.width * 0.25,
                iconSize: 40,
                height: size.height * 0.25 / 2,
                color: kHomeLeftItemColor4,
                title: '',
                iconName: 'assets/icons/heart-icon.svg',
                onPress: () {
                  print("On 4 press");
                },
              ),
              HomeItemCard(
                width: size.width * 0.25,
                iconSize: 40,
                height: size.height * 0.25 / 2,
                color: kHomeLeftItemColor5,
                title: '',
                iconName: 'assets/icons/sun.svg',
                onPress: () {
                  print("On 5 press");
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class RightSide extends StatelessWidget {
  const RightSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.red,
      height: size.height,
      width: size.width * 0.5,
      child: Column(
        children: <Widget>[
          HomeItemCard(
            width: size.width * 0.5,
            iconSize: 100,
            height: size.height * 0.25,
            color: kHomeRightItemColor1,
            title: 'Con người',
            iconName: 'assets/icons/user-icon.svg',
            onPress: () {
              print("On first press");
            },
          ),
          HomeItemCard(
            width: size.width * 0.5,
            iconSize: 100,
            height: size.height * 0.25,
            color: kHomeRightItemColor2,
            title: 'Khoa học vui',
            iconName: 'assets/icons/sun.svg',
            onPress: () {
              print("On second press");
            },
          ),
          HomeItemCard(
            width: size.width * 0.5,
            iconSize: 100,
            height: size.height * 0.25,
            color: kHomeRightItemColor3,
            title: 'Thực vật',
            iconName: 'assets/icons/sun.svg',
            onPress: () {
              print("On third press");
            },
          ),
          HomeItemCard(
            width: size.width * 0.5,
            iconSize: 100,
            height: size.height * 0.25,
            color: kHomeRightItemColor4,
            title: 'Động vật',
            iconName: 'assets/icons/signup.svg',
            onPress: () {
              print("On third press");
            },
          ),
        ],
      ),
    );
  }
}
