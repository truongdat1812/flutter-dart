import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/home/components/feature_plant.dart';
import 'package:plant_app/screens/home/components/header_with_search.dart';
import 'package:plant_app/screens/home/components/recoment_plants.dart';
import 'package:plant_app/screens/home/components/titleWithMoreButton.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double searchBarHeight = 54;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size, searchBarHeight: searchBarHeight),
          TitleWithMoreButton(title: "Recommended", press: () {}),
          RecomentPlans(),
          TitleWithMoreButton(
            title: "Feature Plants",
            press: () {},
          ),
          FeaturePlant(),
          SizedBox(
            height: kDefaultPadding,
          )
        ],
      ),
    );
  }
}
