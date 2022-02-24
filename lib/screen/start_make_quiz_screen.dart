import 'package:flutter/material.dart';

class StartMakeQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MAKE YOUR QUIZ!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: SizedBox(
          child:  Column(
            children: const [
              Text(
                'Hey!!',
              ),
              Text(
                'Hey!!',
              ),
              Text(
                'Hey!!',
              ),
              Text(
                'Hey!!',
              ),
            ],
          ),
        )),
      ),
    );
  }
}
