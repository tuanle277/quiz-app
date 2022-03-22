import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/button_with_gradient.dart';

import '../widgets/alert_dialog.dart';

class QuizMakingScreens extends StatefulWidget {
  final int numberOfQuestion;
  final String nameOfQuiz;
  int current;

  QuizMakingScreens(this.numberOfQuestion, this.nameOfQuiz, this.current);

  @override
  State<QuizMakingScreens> createState() => _QuizMakingScreensState();
}

class _QuizMakingScreensState extends State<QuizMakingScreens> {
  final firstQController = TextEditingController();
  final secondQController = TextEditingController();
  final thirdQController = TextEditingController();
  final fourthQController = TextEditingController();

  final firstAController = TextEditingController();
  final secondAController = TextEditingController();
  final thirdAController = TextEditingController();
  final fourthAController = TextEditingController();

  // void submitQuestion() {
  //   questionSets[nameOfQuiz].add()
  // }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return widget.current < widget.numberOfQuestion + 1
        ? Scaffold(
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
                    height: mediaQuery.height * 0.1,
                  ),
                  Text(
                    "Question ${widget.current}",
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.1,
                  ),
                  ButtonWithGradient(
                      "Question 1",
                      () => showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) =>
                                CustomAlertDialogWith2TextField(
                              firstButtonTitle: 'Cancel',
                              firstController: firstQController,
                              firstTextTitle: "Question",
                              heightt:
                                  MediaQuery.of(context).size.height * 0.16,
                              secondButtonTitle: "Done",
                              secondController: firstAController,
                              secondTextTitle: "Answer",
                              title: "Question 1",
                            ),
                          ),
                      mediaQuery.width * 0.8),
                  SizedBox(
                    height: mediaQuery.height * 0.05,
                  ),
                  ButtonWithGradient(
                      "Question 2",
                      () => showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) =>
                                CustomAlertDialogWith2TextField(
                              firstButtonTitle: 'Cancel',
                              firstController: secondQController,
                              firstTextTitle: "Question",
                              heightt:
                                  MediaQuery.of(context).size.height * 0.16,
                              secondButtonTitle: "Done",
                              secondController: secondAController,
                              secondTextTitle: "Answer",
                              title: "Question 2",
                            ),
                          ),
                      mediaQuery.width * 0.8),
                  SizedBox(
                    height: mediaQuery.height * 0.05,
                  ),
                  ButtonWithGradient(
                      "Question 3",
                      () => showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) =>
                                CustomAlertDialogWith2TextField(
                              firstButtonTitle: 'Cancel',
                              firstController: thirdQController,
                              firstTextTitle: "Question",
                              heightt:
                                  MediaQuery.of(context).size.height * 0.16,
                              secondButtonTitle: "Done",
                              secondController: thirdAController,
                              secondTextTitle: "Answer",
                              title: "Question 3",
                            ),
                          ),
                      mediaQuery.width * 0.8),
                  SizedBox(
                    height: mediaQuery.height * 0.05,
                  ),
                  ButtonWithGradient(
                      "Question 4",
                      () => showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) =>
                                CustomAlertDialogWith2TextField(
                              firstButtonTitle: 'Cancel',
                              firstController: fourthQController,
                              firstTextTitle: "Question",
                              heightt:
                                  MediaQuery.of(context).size.height * 0.16,
                              secondButtonTitle: "Done",
                              secondController: fourthAController,
                              secondTextTitle: "Answer",
                              title: "Question 4",
                            ),
                          ),
                      mediaQuery.width * 0.8),
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
