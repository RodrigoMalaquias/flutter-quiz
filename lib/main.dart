
import 'package:flutter/material.dart';
import './quiz.dart';
import 'result.dart';
main() => runApp( PerguntaApp());


class _PerguntaAppState extends State<PerguntaApp> {

  var _selectedQuestions = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'text': 'What is your favorite color ?',
      'answers': [
        {'text': 'Black', 'score' : 10},
        {'text': 'Red', 'score' : 5},
        {'text': 'Green', 'score' : 3},
        {'tetextxto': 'White', 'score' : 1},
      ]
    },
    {
      'text': 'What is your favorite animal ?',
      'answers': [
        {'text': 'Elephant', 'score': 10}, 
        {'text': 'Lion', 'score': 5}, 
        {'text': 'Rabbit', 'score': 3}, 
        {'text': 'Snake', 'score': 1}
      ]
    },
    {
      'text': 'Who is your favorite instructor ?',
      'answers': [
        {'text': 'Leo', 'score': 10}, 
        {'text': 'Maria', 'score': 5}, 
        {'text': 'João', 'score': 3}, 
        {'text': 'Pedro', 'score': 1}
      ]
    }
  ];

  void _answer(int score) {
    if(hasQuestionSelected) {
      setState(() {
        _selectedQuestions++;
        _totalScore += score;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedQuestions = 0;
      _totalScore = 0;
    });
  }

  bool get hasQuestionSelected {
    return _selectedQuestions < _questions.length;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Questions'),
          centerTitle: true,
        ),
        body: hasQuestionSelected ? 
        Quiz(
          questions: _questions, 
          questionSelected: _selectedQuestions, 
          onAnswer: _answer
          ) 
          : Result(_totalScore, _restartQuiz)
      )
    );
  }

}

class PerguntaApp extends StatefulWidget {

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }

}