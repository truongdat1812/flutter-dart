import 'package:flutter/material.dart';
import 'package:plant_app/screens/home/components/feature_plant_card.dart';

class FeaturePlant extends StatelessWidget {
  const FeaturePlant({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: <Widget>[
        FeaturePlantCard(
          image: "assets/images/bottom_img_1.png",
          press: () {},
        ),
        FeaturePlantCard(
          image: "assets/images/bottom_img_2.png",
          press: () {},
        ),
        FeaturePlantCard(
          image: "assets/images/bottom_img_1.png",
          press: () {},
        )
      ]),
    );
  }
}
