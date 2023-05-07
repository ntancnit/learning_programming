import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_programming/bloc/bloc_question_detail_bloc.dart';
import 'package:learning_programming/widgets/widget_gap.dart';

class PageQuestionDetail extends StatefulWidget {
  const PageQuestionDetail({super.key});

  @override
  State<PageQuestionDetail> createState() => _PageQuestionDetailState();
}

class _PageQuestionDetailState extends State<PageQuestionDetail>
    with TickerProviderStateMixin {
  late AnimationController controller;
  final _questionBloc = BlocQuestionDetailBloc();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _callBackFunction(String value) {
    _questionBloc.add(submitAnswerEvent(
        position: _questionBloc.state.modelQuestion.currentPosition,
        content: value));
  }

  void _deleteAnswer() {
    _questionBloc.add(deleteAnswerEvent(
        position: _questionBloc.state.modelQuestion.currentPosition));
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _questionBloc.add(loadQuestionEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: Row(
          children: const [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.heart_broken,
              color: Colors.red,
            ),
            Text(
              '٤',
              style: TextStyle(color: Colors.red, fontSize: 20),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.cancel_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: BlocProvider(
        create: (context) => _questionBloc,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: LinearProgressIndicator(
                value: controller.value,
                semanticsLabel: 'Linear progress indicator',
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: 70.0,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: BlocBuilder<BlocQuestionDetailBloc,
                      BlocQuestionDetailState>(
                    builder: (context, state) => _getQuestion(context, state),
                  )),
            ),
            Container(
              color: Colors.grey[350],
              child: Column(children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: BlocBuilder<BlocQuestionDetailBloc,
                      BlocQuestionDetailState>(
                    builder: (context, state) => _getFileName(context, state),
                  ),
                ),
                const Divider(
                  height: 0.5,
                  color: Colors.black54,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: BlocBuilder<BlocQuestionDetailBloc,
                      BlocQuestionDetailState>(
                    builder: (context, state) => _getListGaps(context, state),
                  ),
                )
              ]),
            ),
            BlocListener<BlocQuestionDetailBloc, BlocQuestionDetailState>(
              bloc: _questionBloc,
              listener: (context, state) => {
                if (state is CorrectState)
                  {
                    _showDialog(state.modelQuestion.correctMessage, 'Correct',
                        DialogType.success)
                  }
                else if (state is WrongState)
                  {
                    _showDialog(state.modelQuestion.wrongMessage, 'Wrong',
                        DialogType.warning)
                  }
              },
              child: Container(),
            ),
            Expanded(child: Container()),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(3, 0), // changes position of shadow
                  ),
                ],
              ),
              height: 140,
              child: Column(
                children: [
                  SizedBox(
                    height: 70.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.play_circle,
                          color: Colors.red,
                          size: 65,
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.refresh),
                              onPressed: () =>
                                  _questionBloc.add(loadQuestionEvent()),
                            ),
                            IconButton(
                              icon: const Icon(Icons.assignment_return_rounded),
                              onPressed: _deleteAnswer,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 70.0,
                      child: BlocBuilder<BlocQuestionDetailBloc,
                          BlocQuestionDetailState>(
                        builder: (context, state) =>
                            _getListAnswer(context, state),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog(String content, String title, DialogType dialogType) {
    AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.scale,
      title: title,
      desc: content,
      descTextStyle: const TextStyle(color: Colors.grey),
      btnOkOnPress: () {},
    ).show();
  }

  _getListAnswer(context, state) {
    List<Widget> result = List<Widget>.empty(growable: true);
    for (var element in state.modelQuestion.answerSelectionList) {
      result.add(WidgetGap(
        content: element,
        callBackFunction: _callBackFunction,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      ));
    }
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: result);
  }

  _getListGaps(context, state) {
    List<WidgetGap> result = List<WidgetGap>.empty(growable: true);
    for (var element in state.modelQuestion.questionList) {
      result.add(WidgetGap(
        content: element.content,
        backgroundColor: element.editable ? Colors.grey : Colors.transparent,
        margin: const EdgeInsets.all(1),
      ));
    }
    return Row(
      children: result,
    );
  }

  _getQuestion(context, state) {
    return Text(state.modelQuestion.question);
  }

  _getFileName(context, state) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          state.modelQuestion.fileName,
          style: const TextStyle(color: Colors.black54),
        ));
  }
}
