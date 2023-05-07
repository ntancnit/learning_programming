import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:learning_programming/models/model_data.dart';
import 'package:learning_programming/pages/page_other.dart';
import 'package:learning_programming/pages/page_question.dart';
import 'package:learning_programming/widgets/widget_gap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    PageOther(),
    PageOther(),
    PageQuestions(),
    PageOther(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'صفحتي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'المنتدى',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location_sharp),
            label: 'رحلتك',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'الدروس',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[400],
        unselectedItemColor: Colors.grey[400],
        unselectedLabelStyle: TextStyle(color: Colors.grey[400]),
        onTap: _onItemTapped,
      ),
    );
  }
}
