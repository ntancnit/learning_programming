import 'package:learning_programming/models/model_gap.dart';

class ModelQuestion {
  String question;
  String fileName;
  List<String> answerSelectionList;
  List<ModelGap> questionList; // show up on the screen
  int currentPosition;
  String correctAnswer;
  String correctMessage;
  String wrongMessage;

  ModelQuestion({
    required this.question,
    required this.fileName,
    required this.answerSelectionList,
    required this.questionList,
    required this.currentPosition,
    required this.correctAnswer,
    required this.correctMessage,
    required this.wrongMessage,
  });
}
