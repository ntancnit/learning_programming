import 'package:flutter/services.dart';
import 'package:learning_programming/models/model_question.dart';
import '../models/model_data.dart';
import '../models/model_gap.dart';

class ControllerQuestionDetail {
  Future<ModelQuestion> loadQuestion(String id) async {
    final String response =
        await rootBundle.loadString('assets/dump_data.json');
    ModelData modelData =
        ModelData.fromJson(response); // data loaded from dummy data file
    String correctMessage = '';
    String wrongMessage = '';
    for (var elem in modelData.postInteraction) {
      if (0 == elem.order) {
        correctMessage = elem.text;
      }
      if (1 == elem.order) {
        wrongMessage = elem.text;
      }
    }
    ModelQuestion question = ModelQuestion(
        question: 'This is the question?',
        fileName: modelData.files.first.name,
        answerSelectionList: ['<', '>', '/', 'Button'],
        questionList: [
          ModelGap(content: ' ', editable: true),
          ModelGap(content: ' ', editable: true),
          ModelGap(content: ' ', editable: true),
          ModelGap(content: 'Submit now', editable: false),
          ModelGap(content: '<', editable: false),
          ModelGap(content: ' ', editable: true),
          ModelGap(content: 'Button', editable: false),
          ModelGap(content: '>', editable: false)
        ],
        currentPosition: -1,
        correctAnswer: '<Button>Submitnow</Button>',
        correctMessage: correctMessage,
        wrongMessage: wrongMessage);

    return question;
  }

  ModelQuestion getModelAfterSubmitAnswer(
      ModelQuestion currentModelQuestion, int position, String content) {
    position++;
    List<ModelGap> listModel = List.empty(growable: true);
    for (int i = 0; i < currentModelQuestion.questionList.length; i++) {
      if (i != position) {
        listModel.add(currentModelQuestion.questionList[i]);
      } else {
        if (currentModelQuestion.questionList[i].editable == false) {
          listModel.add(currentModelQuestion.questionList[i]);
          position++;
        } else {
          listModel.add(ModelGap(
              content: content,
              editable: currentModelQuestion.questionList[i].editable));
        }
      }
    }
    return _getQuestionModel(currentModelQuestion, listModel,
        position > listModel.length - 1 ? listModel.length - 1 : position);
  }

  int getNextPosition(ModelQuestion currentModelQuestion, int position) {
    position++;
    for (int i = position; i < currentModelQuestion.questionList.length; i++) {
      if (currentModelQuestion.questionList[i].editable == true) {
        return i;
      }
    }
    return currentModelQuestion.questionList.length;
  }

  ModelQuestion getModelAfterDeleteAnswer(
      ModelQuestion currentModelQuestion, int position) {
    List<ModelGap> listModel = List.empty(growable: true);
    for (int i = currentModelQuestion.questionList.length - 1; i >= 0; i--) {
      if (i != position) {
        listModel.insert(0, currentModelQuestion.questionList[i]);
      } else {
        if (currentModelQuestion.questionList[i].editable == false) {
          listModel.insert(0, currentModelQuestion.questionList[i]);
          position--;
        } else {
          listModel.insert(
              0,
              ModelGap(
                  content: ' ',
                  editable: currentModelQuestion.questionList[i].editable));
        }
      }
    }
    return _getQuestionModel(
        currentModelQuestion, listModel, position - 1 < -1 ? -1 : position - 1);
  }

  ModelQuestion _getQuestionModel(ModelQuestion currentModelQuestion,
      List<ModelGap> listModel, int position) {
    ModelQuestion question = ModelQuestion(
      question: currentModelQuestion.question,
      fileName: currentModelQuestion.fileName,
      answerSelectionList: currentModelQuestion.answerSelectionList,
      questionList: listModel,
      currentPosition: position,
      correctAnswer: currentModelQuestion.correctAnswer,
      correctMessage: currentModelQuestion.correctMessage,
      wrongMessage: currentModelQuestion.wrongMessage,
    );
    return question;
  }

  bool isCorrectAnswer(ModelQuestion modelQuestion) {
    String answer = modelQuestion.questionList
        .map((e) => e.content)
        .toList()
        .join()
        .replaceAll(' ', '');
    return modelQuestion.correctAnswer == answer;
  }
}
