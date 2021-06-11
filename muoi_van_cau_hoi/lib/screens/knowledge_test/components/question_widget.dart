import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:muoi_van_cau_hoi/components/radio_check_box.dart';
import 'package:muoi_van_cau_hoi/model/question.dart';

enum AppEnum { optionA, optionB, optionC, optionD, NON }

// ignore: must_be_immutable
class QuestionWidget extends StatefulWidget {
  Question question;
  // CarouselController buttonCarouselController;

  QuestionWidget(
    this.question, {
    Key? key,
  }) : super(key: key);

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState(question);
}

class _QuestionWidgetState extends State<QuestionWidget> {
  _QuestionWidgetState(
    this.item,
  );

  // CarouselController buttonCarouselController;

  Question item;

  AppEnum _character = AppEnum.NON;

  bool _isSelectedA = false;
  bool _isSelectedB = false;
  bool _isSelectedC = false;
  bool _isSelectedD = false;

  int radio = 1;
  int check = 2;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: <Widget>[
          item.type == check ? getCheckBoxWidget(item) : getRadioWidget(item),
          SizedBox(
            height: 30.0,
          ),
          actionButton(),
        ]));
  }

  onVerifyClick() {
    var msg = "";

    if (item.type == radio) {
      if (_character == AppEnum.optionA && item.optionA == item.ans ||
          _character == AppEnum.optionB && item.optionB == item.ans ||
          _character == AppEnum.optionC && item.optionC == item.ans ||
          _character == AppEnum.optionD && item.optionD == item.ans) {
        msg = "Correct";
      } else {
        msg = "Incorrect";
      }
    } else {
      if (_isSelectedA && item.optionA == item.ans ||
          _isSelectedB && item.optionB == item.ans ||
          _isSelectedC && item.optionC == item.ans ||
          _isSelectedD && item.optionD == item.ans) {
        msg = "Correct";
      } else {
        msg = "Incorrect";
      }
    }

    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Widget getRadioWidget(Question item) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              item.question,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          RadioListTile<AppEnum>(
            title: Text(item.optionA),
            value: AppEnum.optionA,
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value!;
              });
            },
          ),
          RadioListTile<AppEnum>(
            title: Text(item.optionB),
            value: AppEnum.optionB,
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value!;
              });
            },
          ),
          RadioListTile<AppEnum>(
            title: Text(item.optionC),
            value: AppEnum.optionC,
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value!;
              });
            },
          ),
          RadioListTile<AppEnum>(
            title: Text(item.optionD),
            value: AppEnum.optionD,
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value!;
              });
            },
          ),
        ]);
  }

  Widget getCheckBoxWidget(Question item) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              item.question,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          CheckBoxWidget(
            label: item.optionA,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _isSelectedA,
            onChanged: (bool newValue) {
              setState(() {
                _isSelectedA = newValue;
              });
            },
          ),
          CheckBoxWidget(
            label: item.optionB,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _isSelectedB,
            onChanged: (bool newValue) {
              setState(() {
                _isSelectedB = newValue;
              });
            },
          ),
          CheckBoxWidget(
            label: item.optionC,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _isSelectedC,
            onChanged: (bool newValue) {
              setState(() {
                _isSelectedC = newValue;
              });
            },
          ),
          CheckBoxWidget(
            label: item.optionD,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _isSelectedD,
            onChanged: (bool newValue) {
              setState(() {
                _isSelectedD = newValue;
              });
            },
          ),
        ]);
  }

  Widget actionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[],
    );
  }

  onNextClick() {
    // buttonCarouselController.nextPage(
    //     duration: Duration(milliseconds: 300), curve: Curves.linear);
  }
}
