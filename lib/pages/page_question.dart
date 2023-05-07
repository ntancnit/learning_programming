import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learning_programming/pages/page_question_detail.dart';

class PageQuestions extends StatefulWidget {
  const PageQuestions({super.key});

  @override
  State<PageQuestions> createState() => _PageQuestionsState();
}

class _PageQuestionsState extends State<PageQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
        ),
        // shape: ShapeDecoration(shape: BorderRadius.only(bottomLeft: Radius.circular(30))),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, item) => ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('HTML أساسيات'),
                subtitle: const Text('HTML إنشاء صفحات الويب باستخدام علامات'),
                onTap: _navigationToQuestionDetail,
              )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _navigationToQuestionDetail() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageQuestionDetail()),
    );
  }
}
