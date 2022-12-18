import 'package:flutter/material.dart';
import 'exam_form.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              children: const [
                ExamForm(),
              ],
            )
        ));
  }
}
