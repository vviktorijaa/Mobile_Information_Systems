import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'exam_card.dart';
import 'exam_form.dart';
import 'model/exam.dart';

class Home extends StatelessWidget {
  Home({super.key});

  static List<Exam> exams = [
    Exam("Your exams:", DateTime.now(), TimeOfDay.now())
  ];

  var sessionManager = SessionManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Exam Organizer',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.calendar_today),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/calendar');
                })
          ],
        ),
        body: Column(
          children: [
            const ExamForm(),
            Expanded(
                child: ListView.builder(
                    itemCount: exams.length,
                    itemBuilder: (contx, index) {
                      return ExamCard(exams[index]);
                    })),
          ],
        ));
  }
}
