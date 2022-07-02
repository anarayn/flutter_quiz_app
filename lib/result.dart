import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;
  const Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    var resultText = 'You did it!';

    if (resultScore <= 8) {
      resultText = "You are awesome and innocent!";
    } else if (resultScore <= 12) {
      resultText = "Pretty likeable!";
    } else if (resultScore <= 18) {
      resultText = 'You are ... Strange!!';
    } else {
      resultText = "You are so bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetQuiz,
            child: Text("Restart the Quiz"),
          ),
        ],
      ),
    );
  }
}
