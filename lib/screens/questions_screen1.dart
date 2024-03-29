import 'package:flutter/material.dart';
import 'package:quizapp/screens/answer_button.dart';
import 'package:quizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    // return const Text("question screen");
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          // mainAxisSize: MainAxisSize.min,

          children: [
            Text(
              currentQuestion.text,
              // style: const TextStyle(
              //   color: Colors.white,
              //   fontSize: 18,
              // ),

              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswer().map((item) {
              return AnswerButton(
                item,
                // answerQuestion(),
                (){
                  answerQuestion(item);
                }
              );
            }),
            // AnswerButton(currentQuestion.answers[0], (){}),
            // AnswerButton(currentQuestion.answers[1], (){}),
            // AnswerButton(currentQuestion.answers[2], (){}),
            // AnswerButton(currentQuestion.answers[3], (){}),
          ],
        ),
      ),
    );
  }
}
