import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_programming/controllers/controller_question_detail.dart';
import 'package:learning_programming/models/model_question.dart';
part 'bloc_question_detail_event.dart';
part 'bloc_question_detail_state.dart';

class BlocQuestionDetailBloc
    extends Bloc<BlocQuestionDetailEvent, BlocQuestionDetailState> {
  static final ModelQuestion _modelQuestion = ModelQuestion(
      question: '',
      fileName: '',
      answerSelectionList: [],
      questionList: [],
      currentPosition: -1,
      correctAnswer: '',
      correctMessage: '',
      wrongMessage: '');
  BlocQuestionDetailBloc()
      : super(BlocQuestionDetailInitial(modelQuestion: _modelQuestion)) {
    on<BlocQuestionDetailEvent>((event, emit) async {
      ControllerQuestionDetail controllerQuestionDetail =
          ControllerQuestionDetail();
      if (event is loadQuestionEvent) {
        ModelQuestion modelQuestion =
            await controllerQuestionDetail.loadQuestion('');
        emit(QuestionLoadedState(modelQuestion: modelQuestion));
      } else if (event is submitAnswerEvent) {
        ModelQuestion mModel =
            controllerQuestionDetail.getModelAfterSubmitAnswer(
                state.modelQuestion, event.position, event.content);
        emit(SubmitAnswerState(modelQuestion: mModel));
        int currentPosition = controllerQuestionDetail.getNextPosition(
            mModel, mModel.currentPosition);
        if (currentPosition == mModel.questionList.length) {
          add(completeEvent());
        }
      } else if (event is deleteAnswerEvent) {
        ModelQuestion mModel = controllerQuestionDetail
            .getModelAfterDeleteAnswer(state.modelQuestion, event.position);
        emit(DeleteAnswerState(modelQuestion: mModel));
      } else if (event is completeEvent) {
        if (controllerQuestionDetail.isCorrectAnswer(state.modelQuestion)) {
          emit(CorrectState(modelQuestion: state.modelQuestion));
        } else {
          emit(WrongState(modelQuestion: state.modelQuestion));
        }
      }
    });
  }
}
