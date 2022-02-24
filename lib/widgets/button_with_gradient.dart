import 'package:flutter/material.dart';

import '../models/constant.dart';

class ButtonWithGradient extends StatelessWidget {
  final String text;
  final Function function;

  ButtonWithGradient(this.text, this.function);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        gradient: buttonGradient,
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      height: mediaQuery.height * 0.07,
      width: mediaQuery.width * 0.8,
      child: ElevatedButton(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
          ),
        ),
        onPressed: function,
      ),
    );
  }
}
