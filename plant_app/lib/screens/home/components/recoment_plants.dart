import 'package:flutter/material.dart';
import 'package:plant_app/screens/details/details_screen.dart';
import 'package:plant_app/screens/home/components/recomended_pant_card.dart';

class RecomentPlans extends StatelessWidget {
  const RecomentPlans({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        RecomendedPlantCard(
          image: "assets/images/image_1.png",
          title: "Samathan",
          country: "Russian",
          price: 440,
          press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailsScreen()));
          },
        ),
        RecomendedPlantCard(
          image: "assets/images/image_2.png",
          title: "Samathan",
          country: "Russian",
          price: 440,
          press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailsScreen()));
          },
        ),
        RecomendedPlantCard(
          image: "assets/images/image_3.png",
          title: "Samathan",
          country: "Russian",
          price: 440,
          press: () {},
        ),
        RecomendedPlantCard(
          image: "assets/images/image_1.png",
          title: "Samathan",
          country: "Russian",
          price: 440,
          press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailsScreen()));
          },
        ),
      ]),
    );
  }
}
