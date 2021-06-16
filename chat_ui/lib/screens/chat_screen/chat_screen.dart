import 'package:chat_ui/models/message.dart';
import 'package:chat_ui/models/user.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User? user;
  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessageCompose() {
    return Container(
        height: 70,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.photo),
              iconSize: 25.0,
              color: Theme.of(context).primaryColor,
            ),
            Expanded(
                child: TextField(
              onChanged: (value) {
                setState(() {});
              },
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(hintText: 'Send a message'),
            )),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.send),
              iconSize: 25.0,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ));
  }

  _buildMessage(Message message, bool isMe) {
    final Container smgWidget = Container(
      width: MediaQuery.of(context).size.width * 0.75,
      margin: isMe
          ? EdgeInsets.only(top: 8, left: 80.0, bottom: 8.0)
          : EdgeInsets.only(top: 8, bottom: 8.0),
      decoration: BoxDecoration(
          color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
          borderRadius: isMe
              ? BorderRadius.only(
                  topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
              : BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message.time!,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              message.text!,
              style: TextStyle(
                  // color: Colors.blueGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ]),
    );

    if (isMe) {
      return smgWidget;
    }
    return Row(
      children: [
        smgWidget,
        IconButton(
          onPressed: () {},
          icon: message.isLiked!
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          color: message.isLiked!
              ? Theme.of(context).primaryColor
              : Colors.blueGrey,
          iconSize: 30.0,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          widget.user!.name!,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz),
            color: Colors.white,
            iconSize: 30.0,
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)),
                    child: ListView.builder(
                        reverse: true,
                        padding: EdgeInsets.only(top: 15.0),
                        itemCount: messages.length,
                        itemBuilder: (BuildContext context, index) {
                          final message = messages[index];
                          bool isMe = message.sender!.id == currentUser.id;
                          return _buildMessage(message, isMe);
                        }),
                  )),
            ),
            _buildMessageCompose(),
          ],
        ),
      ),
    );
  }
}
