import 'package:flutter/material.dart';
import 'package:quizapp/screens/questions_screen1.dart';
import 'package:quizapp/screens/start_screen.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/screens/result_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartQuiz(switchScreen);
    super.initState();
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length){
      setState(() {
        activeScreen= ResultsScreen(selectedAnswers);
        // selectedAnswers = []; now we can't empty the data here

      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(chooseAnswer);
    });
  }



  @override
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}