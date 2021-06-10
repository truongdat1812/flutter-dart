import 'package:flutter/material.dart';
import 'package:rest_api/components/round_button.dart';

class NoteDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Warning"),
      content: Text('Are you sure you want to delete?'),
      actions: <Widget>[
        RoundRectButton(
            text: 'Yes',
            press: () {
              Navigator.of(context).pop(true);
            },
            backgroundColor: Colors.blue,
            textColor: Colors.white),
        RoundRectButton(
            text: 'No',
            press: () {
              Navigator.of(context).pop(false);
            },
            backgroundColor: Colors.blue,
            textColor: Colors.white)
      ],
    );
  }
}
