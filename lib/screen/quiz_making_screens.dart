import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/button_with_gradient.dart';

class QuizMakingScreens extends StatefulWidget {
  final int numberOfQuestion;
  final String nameOfQuiz;

  QuizMakingScreens(this.numberOfQuestion, this.nameOfQuiz);

  @override
  State<QuizMakingScreens> createState() => _QuizMakingScreensState();
}

class _QuizMakingScreensState extends State<QuizMakingScreens> {
  @override
  Widget build(BuildContext context) {
    int current = 1;

    return current < widget.numberOfQuestion + 1
        ? Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonWithGradient(
                  'back',
                  () {},
                  MediaQuery.of(context).size.width * 0.3,
                ),
                ButtonWithGradient(
                  'next',
                  () {
                    setState(
                      () {
                        current++;
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
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Question $current",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Quiz",
                      ),
                      Text(
                        "Quiz",
                      ),
                      Text(
                        "Quiz",
                      ),
                      Text(
                        "Quiz",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Scaffold(
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  'you have finished making the quiz',
                ),
              ),
            ),
          );
  }
}
