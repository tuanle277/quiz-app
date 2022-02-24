import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  final String time;

  Time(this.time);

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        widget.time,
        style: const TextStyle(
          fontSize: 30,
          color: Colors.red,
        ),
      ),
    );
  }
}
