import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;
  const Quiz(this.questions, this.answerQuestion, this.questionIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions.elementAt(questionIndex)['questionText']),
        ...(questions.elementAt(questionIndex)['answers']
                as List<Map<String, Object>>)
            .map((answer) {
          return Answer(answer['text'], () => answerQuestion(answer['score']));
        }).toList()
      ],
    );
  }
}
