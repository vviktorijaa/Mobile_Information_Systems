import 'package:flutter/material.dart';
import 'package:lab_3/exam_card.dart';
import 'exam.dart';
import 'exam_form.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static List<Exam> exams = [
    Exam("Your exams:", DateTime.now(), TimeOfDay.now())
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Exam Organizer',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: Scaffold(
            appBar: AppBar(
                title: const Text(
              'My Exam Organizer',
              style: TextStyle(color: Colors.white),
            )),
            body: Column(
              children: [
                const ExamForm(),
                Expanded(
                    child: ListView.builder(
                        itemCount: exams.length,
                        itemBuilder: (contx, index) {
                          return ExamCard(exams[index]);
                        }))
              ],
            )));
  }
}
