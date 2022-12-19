import 'package:flutter/material.dart';
import 'package:lab_3/exam_card.dart';
import 'calendar.dart';
import 'exam.dart';
import 'exam_form.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        routes: {
          '/': (context) => home(context),
          '/calendar': (context) => const Calendar()
        },
        initialRoute: '/');
  }

  Scaffold home(BuildContext context) {
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
            ExamForm(),
            Expanded(
                child: ListView.builder(
                    itemCount: exams.length,
                    itemBuilder: (contx, index) {
                      return ExamCard(exams[index]);
                    }))
          ],
        ));
  }
}
