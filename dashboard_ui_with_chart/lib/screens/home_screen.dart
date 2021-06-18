import 'package:dashboard_ui_with_chart/config/palette.dart';
import 'package:dashboard_ui_with_chart/data/data.dart';
import 'package:dashboard_ui_with_chart/widgets/country_dropdown.dart';
import 'package:dashboard_ui_with_chart/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _country = 'USA';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(size.height),
          _buildPreventTips(size.height),
          _buildYourOwnTest(size.height),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Palette.primaryColor,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40))),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "COVID-19",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
                CuntryDropdown(
                  countries: ['CN', 'FR', 'IN', 'IT', 'UK', 'USA'],
                  country: _country,
                  onValueChanged: (value) {
                    setState(() {
                      _country = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Are you feel sick?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "If you feel sick with anny COVID-19 symptons, please call or text us immediately for help",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _roundButtonWithText('Call Now', Icons.phone, Colors.red),
                _roundButtonWithText('Send SMS', Icons.message, Colors.blue),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextButton _roundButtonWithText(
      String text, IconData icon, Color background) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(background),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: background)))),
        onPressed: () {},
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              size: 22.0,
              color: Colors.white,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ));
  }

  SliverToBoxAdapter _buildPreventTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Prevent Tips",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: prevention
                    .map((e) => Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Image.asset(
                                e.keys.first,
                                height: screenHeight * 0.12,
                              ),
                              SizedBox(
                                height: 0.015,
                              ),
                              Text(
                                e.values.first,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildYourOwnTest(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.all(10),
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
                colors: [Color(0xFFAD9FE4), Palette.primaryColor])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset('assets/images/own_test.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Do your own test!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Text(
                  "Follow the instructions\nto do your own test.",
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
