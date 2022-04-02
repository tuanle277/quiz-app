import 'package:flutter/material.dart';
import 'package:learn_flutter/screen/quiz_making_screens.dart';

class CustomAlertDialogWith2TextField extends StatefulWidget {
  final String title;
  final double heightt;
  final double widthh;
  final TextEditingController firstController;
  final TextEditingController secondController;
  final String firstButtonTitle;
  final String secondButtonTitle;
  final String firstTextTitle;
  final String secondTextTitle;
  final Function function;
  final String disabledd;
  final String disabledd2;

  CustomAlertDialogWith2TextField({
    @required this.function,
    @required this.firstButtonTitle,
    @required this.firstController,
    @required this.firstTextTitle,
    @required this.heightt,
    @required this.widthh,
    @required this.secondButtonTitle,
    @required this.secondController,
    @required this.secondTextTitle,
    @required this.title,
    this.disabledd,
    this.disabledd2,
  });

  @override
  State<CustomAlertDialogWith2TextField> createState() =>
      _CustomAlertDialogWith2TextFieldState();
}

class _CustomAlertDialogWith2TextFieldState
    extends State<CustomAlertDialogWith2TextField> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SizedBox(
        width: widget.widthh,
        height: widget.heightt,
        child: Column(
          children: <Widget>[
            TextField(
              showCursor: true,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: widget.firstTextTitle,
                // errorText: widget.disabledd,
              ),
              onChanged: (_) => setState(
                () => widget.firstController.text,
              ),
              controller: widget.firstController,
              onSubmitted: (_) => {},
            ),
            TextField(
              showCursor: true,
              onChanged: (_) => setState(
                () => widget.secondController.text,
              ),
              keyboardType: TextInputType.number,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: widget.secondTextTitle,
                // errorText: widget.disabledd2,
              ),
              controller: widget.secondController,
              onSubmitted: (_) => {},
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            widget.firstButtonTitle,
          ),
          onPressed: () {
            Navigator.pop(context);
            widget.firstController.clear();
            widget.secondController.clear();
          },
        ),
        TextButton(
          child: Text(
            widget.secondButtonTitle,
          ),
          onPressed:
              // (widget.disabledd != null || widget.disabledd2 != null)
              //     ? null
              //     :
              widget.function,
        )
      ],
    );
  }
}
