import 'dart:async';
import 'package:flutter/material.dart';

import 'package:learn_flutter/screen/quiz_page.dart';
import 'package:learn_flutter/screen/start.dart';
import 'screen/start.dart';
import 'screen/result_screen.dart';

import './models/constant.dart';

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
                  questionIndex == questionSets["Default"].length ||
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
          if (questionIndex < questionSets["Default"].length) questionIndex++;
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

    final _numOfQuizController = TextEditingController();
    final _nameOfQuizController = TextEditingController();

    @override
    void dispose() {
      _nameOfQuizController.dispose();
      _numOfQuizController.dispose();
      super.dispose();
    }

    final chosenQuiz = "Default";

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
      // routes: {'/quizMakeScreen': (ctx) => QuizMakingScreens()},
      home: screen == 0
          ? Start(
              _play, _numOfQuizController, _nameOfQuizController, chosenQuiz)
          : questionIndex < questionSets[chosenQuiz].length
              ? QuizPage(
                  questionIndex: questionIndex,
                  questions: questionSets[chosenQuiz],
                  answerQuestion: _answerQuestion,
                  showTimer: showTimer,
                  startTimer: startTimer,
                  quit: _resetQuiz,
                )
              : Result(_score, _resetQuiz),
    );
  }
}
