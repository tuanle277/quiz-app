import 'package:flutter/material.dart';
import 'package:learn_flutter/screen/quiz_making_screens.dart';

import '../models/constant.dart';

class Start extends StatelessWidget {
  Function play;
  Function submitDataForQuizMaking;
  TextEditingController numOfQuizController;

  Start(this.play, this.numOfQuizController);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
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
                  Container(
                      alignment: Alignment.center,
                      child: Container(
                        height: mediaQuery.height * 0.07,
                        width: mediaQuery.width * 0.8,
                        decoration: const BoxDecoration(
                          gradient: buttonGradient,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                        ),
                        child: ElevatedButton(
                          child: const Text(
                            "Start game",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  16,
                                ),
                              ),
                            ),
                          ),
                          onPressed: play,
                        ),
                      )),
                  SizedBox(
                    height: mediaQuery.height * 0.02,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: buttonGradient,
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    height: mediaQuery.height * 0.07,
                    width: mediaQuery.width * 0.8,
                    child: ElevatedButton(
                      child: const Text(
                        "Make quiz",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              'Make a quiz',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: SizedBox(
                              height: 70,
                              child: Column(
                                children: <Widget>[
                                  TextField(
                                    showCursor: true,
                                    keyboardType: TextInputType.number,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    decoration: const InputDecoration(
                                      labelText: 'Number of question',
                                    ),
                                    controller: numOfQuizController,
                                    onSubmitted: (_) => {},
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizMakingScreens(
                                      int.parse(
                                        numOfQuizController.text,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
