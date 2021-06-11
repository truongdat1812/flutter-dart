import 'package:flutter/material.dart';
import 'package:muoi_van_cau_hoi/constants.dart';
import './components/body.dart';

class KnowledgeTestHome extends StatefulWidget {
  @override
  _KnowledgeTestHomeState createState() => _KnowledgeTestHomeState();
}

class _KnowledgeTestHomeState extends State<KnowledgeTestHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Kiểm tra kiến thức'),
      ),
      body: Body(),
    );
  }
}
