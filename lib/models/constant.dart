import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/question.dart';

const buttonGradient = LinearGradient(
  colors: [
    Color(0xFF46A0AE),
    Color(0xFF00FFCB),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const kGrayColor = Color(0xFFC1C1C1);

final Map<String, dynamic> questionSets = {
  "Default": [
    {
      'questionText': '1 + 1 = ?',
      'answerText': [
        {'answerId': 'A', 'text': '1', 'score': 0},
        {'answerId': 'B', 'text': '2', 'score': 1},
        {'answerId': 'C', 'text': '3', 'score': 0},
        {'answerId': 'D', 'text': '4', 'score': 0}
      ]
    },
    {
      'questionText': '2 * 3 = ?',
      'answerText': [
        {'answerId': 'A', 'text': '7', 'score': 0},
        {'answerId': 'B', 'text': '6', 'score': 1},
        {'answerId': 'C', 'text': '8', 'score': 0},
        {'answerId': 'D', 'text': '9', 'score': 0}
      ]
    },
    {
      'questionText': '5 * 34 = ?',
      'answerText': [
        {'answerId': 'A', 'text': '43', 'score': 0},
        {'answerId': 'B', 'text': '23', 'score': 0},
        {'answerId': 'C', 'text': '170', 'score': 1},
        {'answerId': 'D', 'text': '123', 'score': 0}
      ]
    },
    {
      'questionText': '9 * 23 = ?',
      'answerText': [
        {'answerId': 'A', 'text': '142', 'score': 0},
        {'answerId': 'B', 'text': '73', 'score': 0},
        {'answerId': 'C', 'text': '253', 'score': 0},
        {'answerId': 'D', 'text': '217', 'score': 1}
      ]
    },
    {
      'questionText': '50 * 40 = ?',
      'answerText': [
        {'answerId': 'A', 'text': '2344', 'score': 0},
        {'answerId': 'B', 'text': '2000', 'score': 1},
        {'answerId': 'C', 'text': '2203', 'score': 0},
        {'answerId': 'D', 'text': '2390', 'score': 0},
      ]
    }
  ]
};
