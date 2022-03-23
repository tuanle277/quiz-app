import 'package:flutter/material.dart';

import 'package:learn_flutter/widgets/button_with_gradient.dart';
import '../widgets/alert_dialog.dart';

import '../models/constant.dart';

class QuizMakingScreens extends StatefulWidget {
  final int numberOfQuestion;
  final String nameOfQuiz;
  int current;

  QuizMakingScreens(this.numberOfQuestion, this.nameOfQuiz, this.current);

  @override
  State<QuizMakingScreens> createState() => _QuizMakingScreensState();
}

class _QuizMakingScreensState extends State<QuizMakingScreens> {
  final questionController = TextEditingController();

  final firstAController = TextEditingController();
  final secondAController = TextEditingController();
  final thirdAController = TextEditingController();
  final fourthAController = TextEditingController();

  void submitQuestion(
    question,
    firstAnswer,
  ) {
    questionSets[widget.nameOfQuiz].add(
      {
        'questionText': question,
        'answerText': [
          {'answerId': 'A', 'text': '1', 'score': 0},
          {'answerId': 'B', 'text': '2', 'score': 1},
          {'answerId': 'C', 'text': '3', 'score': 0},
          {'answerId': 'D', 'text': '4', 'score': 0}
        ]
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return widget.current < widget.numberOfQuestion + 1
        ? Scaffold(
            resizeToAvoidBottomInset: false,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonWithGradient(
                  'back',
                  () {
                    setState(() {
                      widget.current--;
                    });
                  },
                  MediaQuery.of(context).size.width * 0.3,
                ),
                ButtonWithGradient(
                  'next',
                  () {
                    setState(
                      () {
                        widget.current++;
                      },
                    );
                  },
                  MediaQuery.of(context).size.width * 0.3,
                ),
                ButtonWithGradient(
                  'finish',
                  () {},
                  MediaQuery.of(context).size.width * 0.3,
                ),
              ],
            ),
            appBar: AppBar(
              title: Text(
                "Quiz name: ${widget.nameOfQuiz}",
              ),
            ),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: mediaQuery.height * 0.08,
                  ),
                  Text(
                    "Question ${widget.current}",
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.1,
                  ),
                  SizedBox(
                    width: mediaQuery.width * 0.8,
                    child: TextField(
                      showCursor: true,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        labelText: "Question",
                        border: OutlineInputBorder(),
                      ),
                      controller: questionController,
                      onSubmitted: (_) => {},
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.07,
                  ),
                  SizedBox(
                    width: mediaQuery.width * 0.9,
                    child: TextField(
                      showCursor: true,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        labelText: "Answer 1",
                      ),
                      controller: firstAController,
                      onSubmitted: (_) => {},
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.02,
                  ),
                  SizedBox(
                    width: mediaQuery.width * 0.9,
                    child: TextField(
                      showCursor: true,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        labelText: "Answer 2",
                      ),
                      controller: secondAController,
                      onSubmitted: (_) => {},
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.02,
                  ),
                  SizedBox(
                    width: mediaQuery.width * 0.9,
                    child: TextField(
                      showCursor: true,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        labelText: "Answer 3",
                      ),
                      controller: firstAController,
                      onSubmitted: (_) => {},
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.02,
                  ),
                  SizedBox(
                    width: mediaQuery.width * 0.9,
                    child: TextField(
                      showCursor: true,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        labelText: "Answer 4",
                      ),
                      controller: firstAController,
                      onSubmitted: (_) => {},
                    ),
                  )
                ],
              ),
            ),
          )
        : Scaffold(
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: Text(
                  'you have finished making the quiz',
                ),
              ),
            ),
          );
  }
}
