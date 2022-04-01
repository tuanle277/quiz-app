import 'package:flutter/material.dart';

import 'package:learn_flutter/screen/quiz_making_screens.dart';
import 'package:learn_flutter/widgets/alert_dialog.dart';
import 'package:learn_flutter/widgets/button_with_gradient.dart';

import '../models/constant.dart';

class Start extends StatefulWidget {
  final Function play;
  final TextEditingController numOfQuizController;
  final TextEditingController nameOfQuizController;
  String chosenQuiz;

  Start(
    this.play,
    this.numOfQuizController,
    this.nameOfQuizController,
    this.chosenQuiz,
  );

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  Function submitDataForQuizMaking;

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
                    "Start game",
                    widget.play,
                    mediaQuery.width * 0.8,
                  ),
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
                              function: () {
                                numOfQuestionSet
                                    .add(widget.numOfQuizController.text);
                                nameSet.add(widget.nameOfQuizController.text);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizMakingScreens(
                                      int.parse(
                                        widget.numOfQuizController.text,
                                        // ignore: deprecated_member_use
                                        onError: (source) => -1,
                                      ),
                                      widget.nameOfQuizController.text,
                                      1,
                                      widget.nameOfQuizController,
                                      widget.numOfQuizController,
                                    ),
                                  ),
                                );
                              },
                              firstButtonTitle: 'Cancel',
                              firstController: widget.nameOfQuizController,
                              firstTextTitle: "Name of Quiz",
                              heightt: mediaQuery.height * 0.16,
                              secondButtonTitle: "Done",
                              secondController: widget.numOfQuizController,
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
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              scrollable: true,
                              title: const Text(
                                "Pick a quiz!",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: SizedBox(
                                height: mediaQuery.height * 0.3,
                                width: mediaQuery.width * 0.7,
                                child:
                                    //  SingleChildScrollView(
                                    //   physics: const ScrollPhysics(),
                                    //   child:
                                    ListView.builder(
                                  itemCount: nameSet.length,
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
                                        onTap: () {
                                          setState(() {
                                            widget.chosenQuiz = nameSet[index];
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Container(
                                          height: mediaQuery.height * 0.1,
                                          width: mediaQuery.width * 0.5,
                                          decoration: const BoxDecoration(
                                            gradient: buttonGradient,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(200),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              FittedBox(
                                                child: Text(
                                                  nameSet[index],
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                numOfQuestionSet[index]
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                // ),
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
