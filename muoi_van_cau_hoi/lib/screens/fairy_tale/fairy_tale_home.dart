import 'package:flutter/material.dart';
import 'package:muoi_van_cau_hoi/constants.dart';
import 'package:muoi_van_cau_hoi/model/co_tich_data.dart';
import 'package:muoi_van_cau_hoi/model/story.dart';
import './components/background.dart';

class FairyTaleHome extends StatefulWidget {
  @override
  _FairyTaleHomeState createState() => _FairyTaleHomeState();
}

class _FairyTaleHomeState extends State<FairyTaleHome> {
  List<Story> stories = [];
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    for (var item in storys) {
      stories.add(Story.fromJson(item));
    }
    super.initState();
  }

  Widget setupAlertDialoadContainer() {
    return Container(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: stories.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              setState(() {
                this.index = index;
              });
              Navigator.pop(context);
            },
            title: Text(
              stories[index].storyTitle,
              style: TextStyle(color: kPrimaryColor),
            ),
          );
        },
        separatorBuilder: (_, __) => Divider(
          height: 1,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'Cổ tích Việt Nam',
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                  content: setupAlertDialoadContainer(),
                );
              });
        },
        child: Icon(Icons.book),
      ),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Cổ tích Việt Nam'),
      ),
      body: Background(
        child: Container(
          padding: EdgeInsets.all(kDefaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  stories[this.index].storyTitle,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  stories[this.index].storyContent,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
