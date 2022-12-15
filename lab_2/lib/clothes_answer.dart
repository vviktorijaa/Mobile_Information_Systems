import 'package:flutter/material.dart';

@immutable
class ClothesAnswer extends StatelessWidget {
  final String answerText;
  final VoidCallback tapped;

  const ClothesAnswer(this.tapped, this.answerText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 0, left: 0, right: 0),
      child: ElevatedButton(
          onPressed: tapped,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18))),
              minimumSize: MaterialStateProperty.all(const Size(210, 40))),
          child: Text(
            answerText,
            style: const TextStyle(
                color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
          )),
    );
  }
}
