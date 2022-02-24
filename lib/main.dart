import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learn_flutter/screen/quiz_page.dart';
import 'package:learn_flutter/screen/start.dart';
import 'screen/start.dart';
import 'screen/result_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  int screen = 0;
  int _score = 0;
  int questionIndex = 0;
  int timer = 10;
  String showTimer = '10';

  //main widget
  @override //decorator, makes the code cleaner and clearer
  Widget build(BuildContext context) {
    final evaluation = [
      'well, you tried!',
      'unlucky',
      'you got it!',
      'you did well!',
      'you\'re too good!',
      'perfect!!',
    ];

    final questions = [
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
    ];

    // final MadeQuestions = [];

    bool cancelTimer = false;
    // bool restarted = false;

    void startTimer() async {
      const onesec = Duration(
        seconds: 1,
      );
      Timer.periodic(
        onesec,
        (Timer t) {
          setState(
            () {
              if (timer < 2) {
                t.cancel();
                cancelTimer = false;
                timer = 10;
                setState(
                  () {
                    questionIndex++;
                  },
                );

                startTimer();
              } else if (cancelTimer == true ||
                  questionIndex == questions.length ||
                  screen == 0) {
                t.cancel();
                timer = 10;
              } else {
                timer--;
              }
              showTimer = timer.toString();
            },
          );
        },
      );
    }

    void _nextQuestion() {
      cancelTimer = false;
      timer = 11;
      setState(
        () {
          if (questionIndex < questions.length) questionIndex++;
        },
      );

      // startTimer();
    }

    void _startTimer() {
      timer = 10;
    }

    void _answerQuestion(int score) {
      _score += score;
      setState(
        () {
          cancelTimer = true;
        },
      );

      _nextQuestion();
    }

    void _resetQuiz() {
      setState(
        () {
          questionIndex = 0;
          _score = 0;
          screen = 0;
        },
      );
    }

    void _play() {
      setState(
        () => screen++,
      );
      _startTimer();
    }

    final numOfQuizController = TextEditingController();

    // void submitDataForQuizMaking() {}

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz app',
      theme: ThemeData.dark(),
      // (
      //   backgroundColor: Colors.blueGrey[800],
      //   primarySwatch: Colors.amber,
      //   fontFamily: 'QuickSand',
      //   accentColor: Colors.black,
      // ),
      home: screen == 0
          ? Start(_play, numOfQuizController)
          : questionIndex < questions.length
              ? QuizPage(
                  questionIndex: questionIndex,
                  questions: questions,
                  answerQuestion: _answerQuestion,
                  showTimer: showTimer,
                  startTimer: startTimer,
                  quit: _resetQuiz,
                )
              : Result(evaluation[_score], _score, _resetQuiz),
    );
  }
}
