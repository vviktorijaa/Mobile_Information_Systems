import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  ExamCard(this.exam, {Key? key}) : super(key: key);

  final formatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(
            exam.name,
            style: const TextStyle(fontSize: 25),
          ),
          subtitle: Container(
            padding: const EdgeInsets.only(top: 10),
            child: Text.rich(
              TextSpan(
                text: 'Date: ',
                style: const TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: formatter.format(exam.date),
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}