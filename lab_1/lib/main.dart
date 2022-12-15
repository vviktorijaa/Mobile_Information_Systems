import 'package:flutter/material.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(title: const Text("Lab 1")),
          body: const Center(
              child: Text(
                "Viktorija Vrzhovska 181083",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              )
          ),
          backgroundColor: Colors.red,
        )
    );
  }
}