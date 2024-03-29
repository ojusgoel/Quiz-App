import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Container(
                margin: EdgeInsets.all(5.0),
                child: Row(children: [
                  Container(

                    padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                    alignment: Alignment.topCenter,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.greenAccent,
                          ),
                        ),
                        Text(
                          ((data['question_index'] as int) + 1).toString(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            (data['question']) as String,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            (data['user_answer']).toString(),
                            style: GoogleFonts.lato(
                              color: Colors.lightBlue,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            (data['correct_answer']).toString(),
                            style: GoogleFonts.lato(
                              color: Colors.deepPurple,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
