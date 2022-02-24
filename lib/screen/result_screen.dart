import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  final String resultText;

  Result(this.resultText, this.resultScore, this.resetHandler);

  String get resultPhase {
    var resultText = 'You score is: ' + resultScore.toString();

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 100,
                ),
                child: Text(
                  resultPhase,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                resultText,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                height: 60,
                width: 250,
                child: ElevatedButton(
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
                  onPressed: resetHandler,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
