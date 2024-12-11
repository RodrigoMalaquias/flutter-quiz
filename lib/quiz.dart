import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionSelected;
  final void Function(int) onAnswer;

  Quiz( {
    required this.questions,
    required this.questionSelected,
    required this.onAnswer
  });

  bool get hasQuestionSelected {
    return questionSelected < questions.length;
  }

  @override
  Widget build(BuildContext context) {

    List<Map<String, Object>> answers = hasQuestionSelected 
      ? questions[questionSelected].cast() ['answers']
      : [];

    return Column(
          children: [
            Question(questions[questionSelected]['text'] as String),
            ...answers.map((resp) {
              return Answer(
                (resp['text'] as String?) ?? 'Default Text',
                () => onAnswer(int.parse(resp['score'].toString())),
              );
            }),
          ]
    );
  }
}