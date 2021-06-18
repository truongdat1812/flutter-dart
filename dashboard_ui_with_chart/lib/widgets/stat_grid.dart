import 'package:flutter/material.dart';

class StatGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      child: Column(
        children: <Widget>[
          Flexible(
              child: Row(
            children: <Widget>[
              _buildStatCard('Total Cases', '1.8 M', Colors.orange),
              _buildStatCard('Deaths', '105 K', Colors.red),
            ],
          )),
          Flexible(
              child: Row(
            children: <Widget>[
              _buildStatCard('Recovered', '319 K', Colors.green),
              _buildStatCard('Acrive', '1.31 M', Colors.lightBlue),
              _buildStatCard('Critical', 'N/A', Colors.purple),
            ],
          ))
        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, String count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
            Text(
              count,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
