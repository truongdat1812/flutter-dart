import 'package:dashboard_ui_with_chart/screens/screen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final listScreen = [
    HomeScreen(),
    StatsScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  int _curentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listScreen[_curentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curentIndex,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.pink,
        elevation: 0.0,
        onTap: (index) {
          setState(() {
            _curentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [Icons.home, Icons.insert_chart, Icons.event_note, Icons.info]
            .asMap()
            .map((key, value) => MapEntry(
                key,
                BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 16),
                      decoration: BoxDecoration(
                          color: _curentIndex == key
                              ? Colors.blue[600]
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Icon(value),
                    ))))
            .values
            .toList(),
      ),
    );
  }
}
