import 'package:flutter/material.dart';
import 'package:learn_flutter/screen/quiz_making_screens.dart';
import 'package:learn_flutter/widgets/alert_dialog.dart';
import 'package:learn_flutter/widgets/button_with_gradient.dart';

import '../models/constant.dart';

class Start extends StatelessWidget {
  final Function play;
  Function submitDataForQuizMaking;
  final TextEditingController numOfQuizController;
  final TextEditingController nameOfQuizController;

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
                              function: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QuizMakingScreens(
                                    int.parse(
                                      numOfQuizController.text,
                                      // ignore: deprecated_member_use
                                      onError: (source) => -1,
                                    ),
                                    nameOfQuizController.text,
                                    1,
                                  ),
                                ),
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
                      () => showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                "Pick a quiz!",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: SizedBox(
                                height: mediaQuery.height * 0.4,
                                width: mediaQuery.width * 0.8,
                                child: SingleChildScrollView(
                                  physics: const ScrollPhysics(),
                                  child: ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    itemBuilder: (
                                      context,
                                      index,
                                    ) {
                                      return Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(35.0),
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 7,
                                        ),
                                        child: InkWell(
                                          child: Container(
                                            height: 65,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(200),
                                              ),
                                            ),
                                            child: SizedBox(
                                              width: mediaQuery.width * 0.7,
                                              child: Row(
                                                children: const [
                                                  Text('nice'),
                                                  Text('nice')
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
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
