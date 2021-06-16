import 'package:chat_ui/screens/home_screen/components/recent_chat.dart';
import 'package:chat_ui/widgets/category_selector.dart';
import 'package:flutter/material.dart';

import 'components/favorite_contact.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            color: Colors.white,
            iconSize: 30.0,
          ),
          title: Text(
            'Chats',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.white,
              iconSize: 30.0,
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            CategorySelector(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: <Widget>[
                    FavoriteContact(),
                    RecentChats(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
