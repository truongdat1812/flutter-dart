import 'package:flutter/material.dart';
import './components/body.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final words = <String>["text 1", "text 2", "Text 3"];
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        if (index < words.length) {
          return rowBuilder(words[index]);
        }

        return ListTile();
      }),
    );
  }

  Widget rowBuilder(String word) {
    return ListTile(
      title: Text(word),
    );
  }
}
