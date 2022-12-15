import 'package:flutter/material.dart';
import './clothes_question.dart';
import './clothes_answer.dart';

void main() {
  runApp(const ClothesApp());
}

class ClothesApp extends StatefulWidget {
  const ClothesApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return ClothesAppState();
  }
}

class ClothesAppState extends State<ClothesApp> {
  var questions = [
    {
      'question': "Select shirt color:",
      'answer': ['White', 'Black', 'Grey']
    },
    {
      'question': "Select pants color:",
      'answer': ['Black', 'White', 'Blue']
    },
    {
      'question': "Select shoes type:",
      'answer': ['Sneakers', 'Classic shoes', 'High heels']
    }
  ];

  var questionIndex = 0;

  void buttonTapped() {
    setState(() {
      questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choose My Outfit Today',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
          appBar: AppBar(
              title: const Text(
            "Choose My Outfit Today",
            style: TextStyle(color: Colors.white),
          )),
          body: Column(
            children: [
              ClothesQuestion(questions[resolveIndex()]['question'].toString()),
              ...(questions[resolveIndex()]['answer'] as List<String>)
                  .map((answer) {
                return ClothesAnswer(buttonTapped, answer);
              })
            ],
          )),
    );
  }

  int resolveIndex() => questionIndex > 2 ? 0 : questionIndex;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
