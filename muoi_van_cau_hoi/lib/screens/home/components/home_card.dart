import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeItemCard extends StatelessWidget {
  final double width;
  final double height;
  final double iconSize;
  final String title;
  final String iconName;
  final Color color;

  final Function() onPress;
  const HomeItemCard({
    Key? key,
    required this.width,
    required this.height,
    required this.iconSize,
    required this.title,
    required this.iconName,
    required this.color,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        color: color,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  iconName,
                  width: iconSize,
                  height: iconSize,
                ),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
