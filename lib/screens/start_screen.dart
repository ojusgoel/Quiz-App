import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/screens/questions_screen1.dart';
// import 'package:google_fonts/google_fonts.dart';

class StartQuiz extends StatelessWidget {
  const StartQuiz(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.6,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300.0,
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              fontSize: 25.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            // TextStyle(fontSize: 25.0, color: Colors.white),
          ),
          const SizedBox(
            height: 20.0,
          ),
          OutlinedButton.icon(
            onPressed: () {
              // QuestionScreen();
              startQuiz();
              print('button is pressed');
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text('Start Quiz'),
            icon: Icon(Icons.arrow_right_alt),

            // style: ,
          )
        ],
      ),
    );
  }
}
