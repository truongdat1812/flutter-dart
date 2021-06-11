class Question {
  final String question;

  final String optionA;
  final String optionB;
  final String optionC;
  String optionD;

  int type;

  String ans;

  Question(this.question, this.optionA, this.optionB, this.optionC,
      this.optionD, this.ans, this.type);
}
