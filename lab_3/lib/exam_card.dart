import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  ExamCard(this.exam, {super.key});

  final formatter = DateFormat('MM/dd/yyyy');

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: ListTile(
              title: Text(exam.name, style: const TextStyle(fontSize: 25)),
              subtitle: Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  formatter.format(exam.date),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ))),
    );
  }
}
