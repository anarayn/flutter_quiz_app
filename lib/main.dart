import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: MyAppHome(),
    ));
  }
}

class MyAppHome extends StatefulWidget {
  @override
  State<MyAppHome> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyAppHome> {
  var _questionIndex = 0;
  var _totalScore = 0;
  static const _questions = [
    {
      'questionText': 'What is your favorite colour?',
      'answers': [
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 6},
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite Animal',
      'answers': [
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 6},
        {'text': 'Snake', 'score': 10},
        {'text': 'Rabbit', 'score': 1},
      ]
    },
  ];

  void _answerQuestion(int score) {
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex += 1;
        _totalScore += score;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _questionIndex < _questions.length
        ? Quiz(_questions, _answerQuestion, _questionIndex)
        : Result(_totalScore, _resetQuiz);
  }
}
