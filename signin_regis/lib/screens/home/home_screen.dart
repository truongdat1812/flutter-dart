import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:signin_regis/screens/home/components/car_pickup.dart';
import 'package:signin_regis/screens/home/components/home_menu.dart';
import 'package:signin_regis/screens/home/components/ride_picker.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _scaffoldKey = new GlobalKey<ScaffoldState>();
    var _tripDistance = 0;
    final Map<String, Marker> _marker = <String, Marker>{};

    GoogleMapController _mapController;

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(10.7915178, 106.7271422),
                zoom: 14.4746,
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    title: Text(
                      "Taxi App",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: FlatButton(
                        onPressed: () {
                          print("click menu");
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        child: Image.asset("assets/images/ic_menu.png")),
                    actions: <Widget>[
                      Image.asset("assets/images/ic_menu_notify.png")
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: RidePicker((place, selec) {}),
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 40,
                    height: 248,
                    child: CarPickup(_tripDistance),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: HomeMenu(),
    );
  }
}
