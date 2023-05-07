part of 'bloc_question_detail_bloc.dart';

abstract class BlocQuestionDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class loadQuestionEvent extends BlocQuestionDetailEvent {}

class submitAnswerEvent extends BlocQuestionDetailEvent {
  final int position;
  final String content;

  submitAnswerEvent({
    required this.position,
    required this.content,
  });
}

class deleteAnswerEvent extends BlocQuestionDetailEvent {
  final int position;

  deleteAnswerEvent({
    required this.position,
  });
}

class completeEvent extends BlocQuestionDetailEvent {}

// class resetEvent extends BlocQuestionDetailEvent {}

// class deleteAnswerEvent extends BlocQuestionDetailEvent {
//   final int position;

//   deleteAnswerEvent({
//     required this.position,
//   });
// }

// class answerAssistanceEvent extends BlocQuestionDetailEvent {
//   final String answerContent;
//   answerAssistanceEvent({
//     required this.answerContent,
//   });
// }
 