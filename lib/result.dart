import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() onRestartQuiz;

  Result(this.score, this.onRestartQuiz);

  String get textResult {
    if (score < 8) {
      return 'Congratulations!';
    } else if (score < 12) {
      return 'You are good!';
    } else if (score < 16) {
      return 'Impressive!';
    } else {
      return 'God level!';
    }
  }

  String get imageAsset {
    if (score < 8) {
      return 'assets/congratulations.png';
    } else if (score < 12) {
      return 'assets/good.png';
    } else if (score < 16) {
      return 'assets/impressive.png';
    } else {
      return 'assets/god_level.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            textResult,
            style: TextStyle(fontSize: 28),
          ),
        ),
        Center(
          child: Image.asset(
            imageAsset,
            width: 200,
            height: 200,
          ),
        ),
        FloatingActionButton(
          onPressed: onRestartQuiz,
          child: Icon(Icons.refresh),
        ),
      ],
    );
  }
}
