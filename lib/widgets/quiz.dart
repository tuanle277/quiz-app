import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  final String time;
  final Function startTimer;
  final Function initState;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex,
      @required this.time,
      @required this.startTimer,
      @required this.initState});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Quiz Time!!",
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        Center(
          child: Text(
            time,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.red,
            ),
          ),
        ),
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answerText'] as List<Map<String, Object>>)
            .map(
          (answer) {
            return Answer(
              () => answerQuestion(
                answer['score'],
              ),
              answer['text'],
              answer['answerId'],
            );
          },
        ).toList()
      ],
    );
  }
}
