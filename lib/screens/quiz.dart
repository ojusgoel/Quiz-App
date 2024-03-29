import 'package:flutter/material.dart';
import 'package:quizapp/screens/questions_screen1.dart';
import 'package:quizapp/screens/start_screen.dart';


class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{

  // Widget activeScreen = StartQuiz(switchScreen);
  Widget? activeScreen ;

  @override
  void initState() {
    super.initState();
    activeScreen = StartQuiz(switchScreen);
  }


  void switchScreen(){
    setState(() {
      activeScreen = const QuestionScreen();
    });
  }



  @override
  Widget build(context) {
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