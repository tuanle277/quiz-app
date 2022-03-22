import 'package:flutter/material.dart';
import 'package:learn_flutter/screen/quiz_making_screens.dart';
import 'package:learn_flutter/widgets/alert_dialog.dart';
import 'package:learn_flutter/widgets/button_with_gradient.dart';

import '../models/constant.dart';

class Start extends StatelessWidget {
  Function play;
  Function submitDataForQuizMaking;
  TextEditingController numOfQuizController;
  TextEditingController nameOfQuizController;

  Start(
    this.play,
    this.numOfQuizController,
    this.nameOfQuizController,
  );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey[900],
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 140,
              ),
              child: const Text(
                "Welcome to the game!!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: mediaQuery.height * 0.6,
              padding: const EdgeInsets.only(
                top: 150,
              ),
              child: Column(
                children: <Widget>[
                  ButtonWithGradient(
                      "Start game", play, mediaQuery.width * 0.8),
                  SizedBox(
                    height: mediaQuery.height * 0.02,
                  ),
                  ButtonWithGradient(
                      "Make quiz",
                      () => showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) =>
                                CustomAlertDialogWith2TextField(
                              widgetItLedTo: QuizMakingScreens(
                                int.parse(
                                  numOfQuizController.text,
                                  // ignore: deprecated_member_use
                                  onError: (source) => -1,
                                ),
                                nameOfQuizController.text,
                              ),
                              firstButtonTitle: 'Cancel',
                              firstController: nameOfQuizController,
                              firstTextTitle: "Name of Quiz",
                              heightt: mediaQuery.height * 0.16,
                              secondButtonTitle: "Done",
                              secondController: numOfQuizController,
                              secondTextTitle: "Number of question",
                              title: "Quiz making",
                            ),
                          ),
                      mediaQuery.width * 0.8),
                  SizedBox(
                    height: mediaQuery.height * 0.02,
                  ),
                  ButtonWithGradient(
                      "Quiz chosen: ${questionSets.keys.toList()[0]}",
                      () {},
                      mediaQuery.width * 0.8)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
