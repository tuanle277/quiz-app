import 'package:flutter/material.dart';
import 'package:learn_flutter/screen/quiz_making_screens.dart';

class CustomAlertDialogWith2TextField extends StatelessWidget {
  final String title;
  final double heightt;
  final TextEditingController firstController;
  final TextEditingController secondController;
  final String firstButtonTitle;
  final String secondButtonTitle;
  final String firstTextTitle;
  final String secondTextTitle;
  final Function function;

  CustomAlertDialogWith2TextField({
    @required this.function,
    @required this.firstButtonTitle,
    @required this.firstController,
    @required this.firstTextTitle,
    @required this.heightt,
    @required this.secondButtonTitle,
    @required this.secondController,
    @required this.secondTextTitle,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SizedBox(
        height: heightt,
        child: Column(
          children: <Widget>[
            TextField(
              showCursor: true,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(labelText: firstTextTitle),
              controller: firstController,
              onSubmitted: (_) => {},
            ),
            TextField(
              showCursor: true,
              keyboardType: TextInputType.number,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: secondTextTitle,
              ),
              controller: secondController,
              onSubmitted: (_) => {},
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            firstButtonTitle,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: Text(
            secondButtonTitle,
          ),
          onPressed: function,
        )
      ],
    );
  }
}
