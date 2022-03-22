import 'package:flutter/material.dart';
import 'package:learn_flutter/models/constant.dart';

import '../widgets/question.dart';
import '../widgets/answer.dart';

class QuizPage extends StatefulWidget {
  final String showTimer;
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  final Function startTimer;
  final Function quit;

  QuizPage(
      {this.answerQuestion,
      this.questionIndex,
      this.questions,
      this.showTimer,
      this.startTimer,
      this.quit});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    widget.startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 70,
        ),
        child: Column(
          children: [
            Text(
              "Time left: ${widget.showTimer}",
              style: const TextStyle(
                fontSize: 25,
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Question ${widget.questionIndex + 1}/${widget.questions.length}',
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 20,
                color: kGrayColor,
              ),
            ),
            const Divider(
              thickness: 1.2,
            ),
            Question(
              widget.questions[widget.questionIndex]['questionText'],
            ),
            ...(widget.questions[widget.questionIndex]['answerText']
                    as List<Map<String, Object>>)
                .map(
              (answer) {
                return Answer(
                  () => widget.answerQuestion(answer['score']),
                  answer['text'],
                  answer['answerId'],
                );
              },
            ).toList(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Container(
              width: 130,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(300),
                ),
                color: Colors.black,
              ),
              child: RawMaterialButton(
                child: const Text(
                  'Quit',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: widget.quit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
