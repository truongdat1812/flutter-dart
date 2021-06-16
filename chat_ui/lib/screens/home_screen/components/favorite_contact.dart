import 'package:chat_ui/models/message.dart';
import 'package:chat_ui/screens/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';

class FavoriteContact extends StatelessWidget {
  const FavoriteContact({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Favorite Contacts",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz),
              color: Colors.blueGrey,
              iconSize: 30,
            )
          ],
        ),
        Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ChatScreen(
                                  user: favorites[index],
                                )));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(children: <Widget>[
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(favorites[index].imageUrl!),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        favorites[index].name!,
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                  ),
                );
              },
            ))
      ]),
    );
  }
}
