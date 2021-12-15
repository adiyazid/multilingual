class MCQuestionModel {
  String? question;
  Map<String, bool>? option;
  String? answer;


  MCQuestionModel({this.question, this.option, this.answer});

  factory MCQuestionModel.fromMap(map) {
    try {
      return MCQuestionModel(
        question: map['question'] ,
        answer: map['answer'],


      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }


  Map<String, Object?> toMap() {
    return {
      'question': question,
      'answer': answer,

    };
  }
}