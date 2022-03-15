import 'question.dart';

class QuestionModel {
  final List<Questions> _questionGroup = [
    Questions(
        questions: 'there are 8 planets in our solar system', answers: 'yes'),
    Questions(questions: 'cats are wild animals', answers: 'yes'),
    Questions(questions: 'China is located in africa', answers: 'no'),
    Questions(questions: 'the earth is flat XD', answers: 'no'),
  ];
  String getQuestionText(int questionNumber) {
    return _questionGroup[questionNumber].questions;
  }

  String getAnswerText(int questionNumber) {
    return _questionGroup[questionNumber].answers;
  }

  getArrayLength() {
    return _questionGroup.length;
  }
}
