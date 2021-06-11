import 'package:flutter/material.dart';
import 'package:muoi_van_cau_hoi/constants.dart';
import 'package:muoi_van_cau_hoi/model/questions.dart';
import 'package:muoi_van_cau_hoi/screens/knowledge_test/components/question_widget.dart';

class QuizScreen extends StatelessWidget {
  // CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Kiểm tra kiến thức"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              QuestionWidget(questions[0]),
              QuestionWidget(questions[1]),
              QuestionWidget(questions[2]),
              QuestionWidget(questions[3])
            ],
          ),
        ));
  }
}
