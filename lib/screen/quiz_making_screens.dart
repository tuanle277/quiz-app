import 'package:flutter/material.dart';

class QuizMakingScreens extends StatelessWidget {
  final int numberOfQuestion;

  QuizMakingScreens(this.numberOfQuestion);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Making"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Text(
                "Question 1",
                style: TextStyle(
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
    );
  }
}
