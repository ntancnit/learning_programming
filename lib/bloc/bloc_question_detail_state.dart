part of 'bloc_question_detail_bloc.dart';

abstract class BlocQuestionDetailState extends Equatable {
  final ModelQuestion modelQuestion;

  @override
  List<Object?> get props => [modelQuestion];
  const BlocQuestionDetailState({
    required this.modelQuestion,
  });
}

class BlocQuestionDetailInitial extends BlocQuestionDetailState {
  BlocQuestionDetailInitial({required super.modelQuestion});
}

class QuestionLoadedState extends BlocQuestionDetailState {
  QuestionLoadedState({required super.modelQuestion});
}

class SubmitAnswerState extends BlocQuestionDetailState {
  SubmitAnswerState({
    required super.modelQuestion,
  });
}

class DeleteAnswerState extends BlocQuestionDetailState {
  DeleteAnswerState({
    required super.modelQuestion,
  });
}

class CorrectState extends BlocQuestionDetailState {
  CorrectState({required super.modelQuestion});
}

class WrongState extends BlocQuestionDetailState {
  WrongState({required super.modelQuestion});
}
