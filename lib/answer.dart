import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final String text;
  final void Function() onPressed;

  Answer(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.inversePrimary),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}