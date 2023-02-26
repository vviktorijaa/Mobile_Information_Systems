import 'package:flutter/material.dart';

@immutable
class ClothesQuestion extends StatelessWidget {
  final String questionContent;

  const ClothesQuestion(this.questionContent, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30, bottom: 30, left: 0, right: 0),
      child: Text(
        questionContent,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 30,
            color: Color(0xFF315277),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
